class CreateWorkouts < ActiveRecord::Migration
  def change
  	enable_extension 'hstore'
    create_table :workouts do |t|
      t.references :user, index: true
      t.hstore :exercises

      t.timestamps null: false
    end
    add_foreign_key :workouts, :users
    add_index :workouts, :exercises, using: :gist
  end
end
