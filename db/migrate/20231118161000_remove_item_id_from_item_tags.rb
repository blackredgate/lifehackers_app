class RemoveItemIdFromItemTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :item_tags, :item_id, :integer
  end
end
