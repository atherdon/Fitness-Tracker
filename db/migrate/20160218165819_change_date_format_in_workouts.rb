class ChangeDateFormatInWorkouts < ActiveRecord::Migration
  def change
  	remove_column :workouts, :date
  	add_column :workouts, :date, :datetime
  end
end
