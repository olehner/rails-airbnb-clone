class Address < ApplicationRecord
  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true

end