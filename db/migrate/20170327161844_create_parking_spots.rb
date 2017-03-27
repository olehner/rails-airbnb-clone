class CreateParkingSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_spots do |t|
      t.string :size
      t.float :price_per_day
      t.references :address, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
