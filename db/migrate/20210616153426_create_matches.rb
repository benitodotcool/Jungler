class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|

      t.references :requestor, index: true 
      t.references :receiver, index: true
      t.string :users_tag_list
      t.boolean :status, default: false
      
      t.timestamps
    end
  end
end
