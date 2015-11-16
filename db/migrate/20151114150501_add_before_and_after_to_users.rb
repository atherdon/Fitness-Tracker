class AddBeforeAndAfterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :before, :integer
    add_column :users, :after, :integer
  end
end
