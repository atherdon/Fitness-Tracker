class AddStatsBeforeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :stats_before, :hstore
    add_index :users, :stats_before, using: :gist
  end
end
