class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :summoner_name
      t.integer :icon_profile_id
      
      t.string  :primary_role
      t.string  :secondary_role
      t.text    :description
      
      t.timestamps
      t.belongs_to :user_game_stat

      
    end
  end
end
