class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.bigint :product_id
      t.bigint :customer_id
      t.string :order_status
      t.string :order_option
      t.string :shipping
      t.string :payment
      t.integer :subtotal
      t.integer :shipping_fee
      t.integer :convenience
      t.integer :grand_total

      t.timestamps
    end
  end
end
