class CreateUserGameStats < ActiveRecord::Migration[5.2]
  def change
    create_table :user_game_stats do |t|
      
      t.belongs_to :users

      t.integer :level
      t.string :summoner_id

      t.string :primary_role
      t.string :secondary_role
      t.text :description
    
      t.timestamps
    end
  end
end
