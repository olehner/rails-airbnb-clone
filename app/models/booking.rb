class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot
  has_many :reviews, :as => :reviewable
end
