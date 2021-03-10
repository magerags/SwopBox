class CreateBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes do |t|
      t.string :venue
      t.integer :seats
      t.integer :price
      t.integer :rating
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
