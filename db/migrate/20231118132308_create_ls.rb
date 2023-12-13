class CreateLs < ActiveRecord::Migration[6.1]
  def change
    create_table :ls do |t|
      t.integer :lifehack_id, null: false
      t.integer :lifehack_tag_id, null: false
      t.timestamps
    end
  end
end
