class User < ApplicationRecord
  belongs_to :account
  has_many :comments
  belongs_to :address
  has_many :reviews, as: :reviewable
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :phone_number, presence: true
  validates :is_parklord, presence: true, default: false
end