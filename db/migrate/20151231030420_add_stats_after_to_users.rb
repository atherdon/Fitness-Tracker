class AddStatsAfterToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :stats_after, :hstore
    add_index :users, :stats_after, using: :gist
  end
end
