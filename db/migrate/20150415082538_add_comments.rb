class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :github_id
      t.string :username
      t.text :body
      t.datetime :posted_at
      t.text :raw_data
      t.integer :line
      t.integer :position

      t.references :commit, index: true
      t.references :repository, index: true

      t.timestamps null: false
    end

  end
end
