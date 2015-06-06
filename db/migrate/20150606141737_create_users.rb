class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :passwd_hash, null: false
      t.string :salt, null: false
      t.string :token, null: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :token, unique: true
  end
end
