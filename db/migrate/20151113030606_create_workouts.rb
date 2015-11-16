class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :workouts, :users
  end
end
