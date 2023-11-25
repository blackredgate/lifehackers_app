class CreateItemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :item_tags do |t|
      t.integer :item_id, null: false
      t.string :itag_name, null: false
      t.timestamps
    end
  end
end
