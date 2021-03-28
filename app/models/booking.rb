class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
