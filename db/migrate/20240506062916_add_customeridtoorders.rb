class AddCustomeridtoorders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :customer_id, :bigint
  end
end
