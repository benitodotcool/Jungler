module UsersHelper

  def get_api_summoner(summoner_request)
    begin
      @summoner_name = summoner_request
      @summoner_request = ERB::Util.url_encode(summoner_request.delete(' ').downcase)
      @env =  ENV['RIOT_API_KEY']
     #Call Summoner
    rescue
    else
      begin
        @response_summoner = RestClient.get ("https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{@summoner_request}?api_key=#{@env}")
      rescue
        
        if @summoner_request == "" &&  @summoner_name_origin == nil
          respond_to do |format|
            format.html {redirect_to edit_user_path(current_user.id), warning: "Tu dois renseigner un nom d'invocateur !" }
            end
        elsif @summoner_request == "" &&  @summoner_name_origin != nil
          respond_to do |format|
            format.html {redirect_to users_path, success: "Gloire à toi, #{@summoner_name_origin}" }
            end
        else
        respond_to do |format|
          format.html {redirect_to edit_user_path(current_user.id), warning: "#{summoner_request} n'est pas un nom d'invocateur valide !" }
          end
        end
      else 
        response_summoner_in_hash = eval(@response_summoner.body)
        @summoner_id              = response_summoner_in_hash.values_at(:id).join
        @level                    = response_summoner_in_hash.values_at(:summonerLevel).join
        @icon_profile_id          = response_summoner_in_hash.values_at(:profileIconId).join
        @name                     = response_summoner_in_hash.values_at(:name).join
  
      end
    
      #Call Champion
      begin
        @champions_response = RestClient.get ("https://euw1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{@summoner_id}?api_key=#{@env}")

        @last_3_champions = eval(@champions_response.body)
        @ugs = UserGameStat.find_by(user_id:@user.id)

        @first_champion_level  = @last_3_champions[0].values_at(:championLevel).join.to_i
        @first_champion_id     = @last_3_champions[0].values_at(:championId).join.to_i
        @second_champion_level = @last_3_champions[1].values_at(:championLevel).join.to_i
        @second_champion_id    = @last_3_champions[1].values_at(:championId).join.to_i
        @third_champion_level  = @last_3_champions[2].values_at(:championLevel).join.to_i
        @third_champion_id     = @last_3_champions[2].values_at(:championId).join.to_i
        
        @first_champion_name = CHAMPIONS.fetch(@first_champion_id )
        
        @second_champion_name = CHAMPIONS.fetch(@second_champion_id )
        
        @third_champion_name = CHAMPIONS.fetch(@third_champion_id )
        
        if @summoner_id != nil
          @ugs.update!( 
          first_champion_id: @first_champion_id, 
          first_champion_level: @first_champion_level,
          first_champion_name: @first_champion_name,
          second_champion_id: @second_champion_id, 
          second_champion_level: @second_champion_level,
          second_champion_name: @second_champion_name,
          third_champion_id: @third_champion_id, 
          third_champion_level: @third_champion_level,
          third_champion_name: @third_champion_name
          )
        end
      rescue
      end
      if @summoner_id != nil
        @ugs.update!( 
        summoner_id: @summoner_id, 
        level: @level
        )
  
        @summoner_request = CGI::unescape(@summoner_request)
        @user = User.find(current_user.id)
        @user.update!(icon_profile_id:@icon_profile_id, summoner_name:@summoner_name)
        
        if @user.description == ""
          description = "Rejoins-moi dans la Jungle !"
          @user.update!(description: description)
        end
        respond_to do |format|
          if @summoner_id != nil
            format.html {redirect_to users_path, success: "Gloire à toi, #{@summoner_request} ! " }
          else
          end
        end
      end
    end
  end
  
end
