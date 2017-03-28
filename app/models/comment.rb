class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :content, presence: true
end
