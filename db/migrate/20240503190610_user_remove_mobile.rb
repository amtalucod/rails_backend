class UserRemoveMobile < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :mobile, :string
  end
end
