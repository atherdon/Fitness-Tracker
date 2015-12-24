class AddStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stats, :hstore
    add_index :users, :stats, using: :gist
  end
end
