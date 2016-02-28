class AddNameToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :name, :string
  end
end
