class ParkingSpot < ApplicationRecord
  belongs_to :address
  belongs_to :user
end
