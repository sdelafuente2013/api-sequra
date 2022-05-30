class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :amount
      t.datetime :created_at
      t.datetime :completed_at
      t.references :merchant, foreign_key: true
      t.references :shopper, foreign_key: true

      t.timestamps
    end
  end
end
