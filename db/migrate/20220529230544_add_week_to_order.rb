class AddWeekToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :week, :int
  end
end
