class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :encrypted_password
      t.string :authentication_token
      t.references :repository, index: true

      t.timestamps null: false
    end

    add_index :users, :username
    add_index :users, [:username, :encrypted_password]
  end
end
