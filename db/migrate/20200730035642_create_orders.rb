class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :driver_id
      t.string :customer_id
      t.string :product_id
      t.string :time

      t.timestamps
    end
  end
end
