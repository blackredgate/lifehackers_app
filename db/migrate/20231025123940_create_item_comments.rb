class CreateItemComments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_comments do |t|
      t.integer :item_id, null: false
      t.integer :user_id, null: false
      t.text :item_comment, null: false
      t.timestamps
    end
  end
end
