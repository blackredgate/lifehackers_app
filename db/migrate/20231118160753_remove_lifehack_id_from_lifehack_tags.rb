class RemoveLifehackIdFromLifehackTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :lifehack_tags, :lifehack_id, :integer
  end
end
