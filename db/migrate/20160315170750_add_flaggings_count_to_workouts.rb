class AddFlaggingsCountToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :flaggings_count, :integer
  end
end
