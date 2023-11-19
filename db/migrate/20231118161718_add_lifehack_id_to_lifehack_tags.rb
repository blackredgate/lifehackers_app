class AddLifehackIdToLifehackTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :lifehack_tags, :lifehack, foreign_key: true
  end
end
