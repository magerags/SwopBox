class Box < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many_attached :photos
end
