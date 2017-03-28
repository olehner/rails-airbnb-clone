class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :reviewable, :polymorphic => true
  validates :rating, presence: true
  validates :rating, inclusion: { in: %w( 1 2 3 4 5), allow_nil: false}
end
