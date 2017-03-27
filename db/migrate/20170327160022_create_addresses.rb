class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :street_number
      t.string :zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
