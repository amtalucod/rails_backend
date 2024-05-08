class ChangeCustomerIdtoCustomer < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :customer_id, :customer
  end
end
