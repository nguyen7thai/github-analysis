class AddFilePathToComments < ActiveRecord::Migration
  def change
    add_column :comments, :file_path, :string
  end
end
