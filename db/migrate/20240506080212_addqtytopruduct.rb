class Addqtytopruduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :quantity, :string
  end
end
