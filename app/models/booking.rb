class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot
  has_many :comments
  has_many :reviews, :as => :reviewable
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: ["pending", "confirmed", "cancelled", "completed"], allow_nil: false }
end