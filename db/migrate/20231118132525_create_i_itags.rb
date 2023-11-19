class CreateIItags < ActiveRecord::Migration[6.1]
  def change
    create_table :i_itags do |t|
      t.integer :item_id, null: false
      t.integer :item_tag_id, null: false
      t.timestamps
    end
  end
end
