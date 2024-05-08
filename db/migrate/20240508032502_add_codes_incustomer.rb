class AddCodesIncustomer < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :province_code, :string
    add_column :customers, :city_code, :string
    add_column :customers, :barangay_code, :string
  end
end
