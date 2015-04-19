class AddFetchHistories < ActiveRecord::Migration
  def change
    create_table :fetch_histories do |t|
      t.string :fetch_type
      t.string :status
      t.datetime :finished_at
      t.timestamps null: false
    end

    add_index :fetch_histories, :fetch_type
  end
end
