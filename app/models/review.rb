class Review < ApplicationRecord
  belongs_to :booking

  def blank_stars
    5 - rating.to_i
  end
end
