class AddNumberToXsets < ActiveRecord::Migration
  def change
    add_column :xsets, :number, :integer
  end
end
