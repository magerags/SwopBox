class RemoveBoxFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookings, :box, null: false, foreign_key: true
  end
end
