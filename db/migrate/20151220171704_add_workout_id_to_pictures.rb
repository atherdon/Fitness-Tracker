class AddWorkoutIdToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :workout, index: true
    add_foreign_key :pictures, :workouts
  end
end
