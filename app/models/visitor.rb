class Visitor < ApplicationRecord
  validates :email, uniqueness: true
end
