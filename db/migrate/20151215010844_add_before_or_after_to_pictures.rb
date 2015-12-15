class AddBeforeOrAfterToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :bora, :string
  end
end
