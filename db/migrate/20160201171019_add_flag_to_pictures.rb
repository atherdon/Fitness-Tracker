class AddFlagToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :flagged, :string
  end
end
