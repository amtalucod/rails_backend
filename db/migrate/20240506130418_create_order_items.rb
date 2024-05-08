class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :quantity

      t.timestamps
    end
  end
end
