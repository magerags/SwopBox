class Box < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many_attached :photos

  def fee
    price.to_i * 0.08
  end

  def total
    price.to_i + fee
  end
end
