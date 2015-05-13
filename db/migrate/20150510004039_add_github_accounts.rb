class AddGithubAccounts < ActiveRecord::Migration
  def change
    create_table :github_accounts do |t|
      t.string :username, unique: true
      t.string :email
      t.string :github_id
      t.string :name

      t.timestamps null: false
    end

    add_index :github_accounts, :username
    add_index :github_accounts, :email
    add_index :github_accounts, :name
  end
end
