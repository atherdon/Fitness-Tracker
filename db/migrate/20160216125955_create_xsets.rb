class CreateXsets < ActiveRecord::Migration
  def change
    create_table :xsets do |t|
      t.references :exercise, index: true

      t.timestamps null: false
    end
    add_foreign_key :xsets, :exercises
  end
end
