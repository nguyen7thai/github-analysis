class AddCommitsGithubAccounts < ActiveRecord::Migration
  def change
    create_table :commits_github_accounts do |t|
      t.integer :commit_id
      t.integer :github_account_id
      t.timestamps null: false
    end

    add_foreign_key :commits_github_accounts, :commits
    add_foreign_key :commits_github_accounts, :github_accounts
    add_index :commits_github_accounts, [:commit_id, :github_account_id], name: 'commits_github_accounts_index'
  end
end
