class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false
      t.string :item_title, null: false
      t.text :item_body, null: false
      t.timestamps
    end
  end
end
