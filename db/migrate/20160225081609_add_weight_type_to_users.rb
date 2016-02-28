class AddWeightTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weight_type, :string
  end
end
