class AddGithubAccountIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :github_account_id, :integer
    add_index :comments, :github_account_id
    add_foreign_key :comments, :github_accounts
  end
end
