class Change < ActiveRecord::Migration[7.1]
  def change
    rename_column :order_items, :quantity, :qty
  end
end
