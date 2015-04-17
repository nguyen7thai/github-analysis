class AddRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :github_id
      t.string :name
      t.text :raw_data
      t.timestamps null: false
    end
  end
end
