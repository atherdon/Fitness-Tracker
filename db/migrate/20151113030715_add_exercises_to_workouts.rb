class AddExercisesToWorkouts < ActiveRecord::Migration
  def change
  	enable_extension "hstore"
  	add_column :workouts, :exercises, :hstore
  	add_index :workouts, :exercises, using: :gist
  end
end
