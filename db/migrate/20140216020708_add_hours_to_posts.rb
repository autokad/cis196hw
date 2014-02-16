class AddHoursToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hours, :integer
  end
end
