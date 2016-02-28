class DropHstoreFromWorkouts < ActiveRecord::Migration
  def change
  	remove_column :workouts, :exercises
  end
end
