class Changebarnggay < ActiveRecord::Migration[7.1]
  def change
    rename_column :customers, :baranggay, :barangay
  end
end
