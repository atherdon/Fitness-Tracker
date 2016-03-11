class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :subject
      t.string :body
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :suggestions, :users
  end
end
