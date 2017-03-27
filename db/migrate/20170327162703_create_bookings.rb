class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, foreign_key: true
      t.references :parking_spot, foreign_key: true

      t.timestamps
    end
  end
end
