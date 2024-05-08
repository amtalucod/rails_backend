class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :province
      t.string :city
      t.string :baranggay
      t.string :street
      t.string :room
      t.string :floor
      t.string :bldg
      t.string :landmark
      t.string :remarks

      t.timestamps
    end
  end
end
