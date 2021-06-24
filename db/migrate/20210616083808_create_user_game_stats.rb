class CreateUserGameStats < ActiveRecord::Migration[5.2]
  def change
    create_table :user_game_stats do |t|
      
      t.belongs_to :user

      t.integer :level
      t.string  :summoner_id

      t.string  :primary_role
      t.string  :secondary_role
      t.text    :description
      
      t.integer :first_champion_id
      t.integer :first_champion_level
      t.string  :first_champion_name

      t.integer :second_champion_id
      t.integer :second_champion_level
      t.string  :second_champion_name

      t.integer :third_champion_id
      t.integer :third_champion_level
      t.string  :third_champion_name

    
      
      t.timestamps
    end
  end
end
