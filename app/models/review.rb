class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :reviewable, :polymorphic => true
end
