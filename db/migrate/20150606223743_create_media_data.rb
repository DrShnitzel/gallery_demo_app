class CreateMediaData < ActiveRecord::Migration
  def change
    create_table :media_data do |t|
      t.integer :user_id, null: false
      t.string :url, null: false
      t.string :file, null: false

      t.timestamps null: false
    end
    add_index :media_data, [:user_id, :id]
  end
end
