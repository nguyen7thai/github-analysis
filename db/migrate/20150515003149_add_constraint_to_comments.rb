class AddConstraintToComments < ActiveRecord::Migration
  def change
    add_foreign_key :comments, :commits
    add_foreign_key :comments, :repositories
  end
end
