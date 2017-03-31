class Address < ApplicationRecord

  # validates :street_name, presence: true
  # validates :street_number, presence: true
  # validates :zip_code, presence: true
  # validates :city, presence: true
  # validates :country, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  def full_address
    "#{street_number} #{street_name}, #{zip_code}, #{city} #{country}"
  end

  def full_address_changed?
    street_name_changed? || zip_code_changed? || city_changed? || country_changed?
  end

  # def user
  #   User.find(address_id: self.id)
  # end

end
