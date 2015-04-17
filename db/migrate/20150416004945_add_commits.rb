class AddCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :committer
      t.datetime :committed_at
      t.text :raw_data
      t.references :repository, index: true

      t.timestamps null: false
    end

    add_index :commits, :sha
    add_index :commits, :committer
  end
end
