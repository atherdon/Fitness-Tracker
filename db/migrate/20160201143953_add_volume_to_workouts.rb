class AddVolumeToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :volume, :string
  end
end
