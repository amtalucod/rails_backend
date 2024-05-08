class Changecustomertype < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :customer, :string
  end
end
