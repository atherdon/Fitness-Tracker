class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.references :xset, index: true
      t.integer :number

      t.timestamps null: false
    end
    add_foreign_key :reps, :xsets
  end
end
