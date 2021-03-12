class Event < ApplicationRecord
  belongs_to :box
  has_many :bookings
end
