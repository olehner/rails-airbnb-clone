class Address < ApplicationRecord
  belongs_to :parking_spot
  belongs_to :user
  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
end