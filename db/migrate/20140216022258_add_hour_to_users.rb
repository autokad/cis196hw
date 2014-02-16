class AddHourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hours, :integer
  end
end
