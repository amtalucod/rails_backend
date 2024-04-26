class AddlocationIdtousers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :location_id, :string
  end
end
