class AddItemIdToItemTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :item_tags, :item, foreign_key: true
  end
end
