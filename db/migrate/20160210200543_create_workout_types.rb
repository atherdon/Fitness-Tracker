class CreateWorkoutTypes < ActiveRecord::Migration
  def change
    create_table :workout_types do |t|
      t.string :name
      t.string :guide
      t.string :mechanics
      t.string :workout_type
      t.string :level
      t.string :main_muscle
      t.string :other_muscles
      t.string :force

      t.timestamps null: false
    end
  end
end
