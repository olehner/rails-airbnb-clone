class ParkingSpot < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :address, dependent: :destroy
  belongs_to :user
  has_many :reviews, as: :reviewable
  has_many :bookings
  validates :size, presence: true, inclusion: { in: ["small", "medium", "large"], allow_nil: false }
  validates :price_per_day, presence: true
end
