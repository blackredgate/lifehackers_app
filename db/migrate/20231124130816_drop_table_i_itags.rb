class DropTableIItags < ActiveRecord::Migration[6.1]
  def change
    drop_table :i_itags do |t|
    t.integer :item_id, null: false
    t.integer :item_tag_id, null: false
    t.timestamps
  end
  end
end
