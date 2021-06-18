class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.belongs_to :conversation
      t.text :content 
      t.boolean :is_read, default: false

      t.belongs_to :user, index: true 

      t.timestamps
    end
  end
end
