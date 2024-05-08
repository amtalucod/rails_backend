class Add < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :region, :string
  end
end
