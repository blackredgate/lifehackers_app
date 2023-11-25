class CreateLifehackTags < ActiveRecord::Migration[6.1]
  def change
    create_table :lifehack_tags do |t|
      t.integer :lifehack_id, null: false
      t.string :ltag_name, null: false
      t.timestamps
    end
  end
end
