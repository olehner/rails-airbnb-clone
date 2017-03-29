class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :account, dependent: :destroy
  belongs_to :address, dependent: :destroy
  has_many :comments
  has_many :bookings
  has_many :parking_spots, dependent: :destroy
  has_many :reviews, as: :reviewable
  validates :username, presence: true, uniqueness: true, on: :update
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :date_of_birth, presence: true, on: :update
  validates :phone_number, presence: true, on: :update
  validates :is_parklord, inclusion: { in: [true, false] }
end

