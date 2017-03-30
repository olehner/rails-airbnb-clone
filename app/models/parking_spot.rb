class ParkingSpot < ApplicationRecord

  SIZES = ["small", "medium", "large"]

  belongs_to :address, dependent: :destroy
  belongs_to :user
  has_many :reviews, as: :reviewable
  has_many :bookings
  validates :size, presence: true, inclusion: { in: SIZES, allow_nil: false }
  validates :price_per_day, presence: true

  mount_uploader :photo, PhotoUploader

  accepts_nested_attributes_for :address

  def self.return_address_with_coordinates
    all.map(&:address).select{|address| address.latitude && address.longitude }
  end

  def parklord
    user
  end

end
