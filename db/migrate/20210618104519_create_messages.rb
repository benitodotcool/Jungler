class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.belongs_to :conversation
      t.text :content 
      t.boolean :is_read, default: false

      t.references :sender_id, index: true 

      t.timestamps
    end
  end
end
