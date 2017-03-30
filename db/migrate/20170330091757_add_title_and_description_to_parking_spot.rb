class AddTitleAndDescriptionToParkingSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_spots, :title, :string
    add_column :parking_spots, :description, :string
  end
end
