class RenameNumberInReps < ActiveRecord::Migration
  def change
  	remove_column :reps, :number, :weight
  	add_column :reps, :weight, :integer
  	add_column :reps, :reps, :integer
  end
end
