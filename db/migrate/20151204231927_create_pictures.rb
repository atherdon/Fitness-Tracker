class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.string :attachment
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :users
    add_index :pictures, [:user_id, :attachment]
  end
end
