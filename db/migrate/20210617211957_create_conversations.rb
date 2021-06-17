class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|

      t.references :participant_a, index: true 
      t.references :participant_b, index: true
      
      t.timestamps
    end
  end
end
