class AddNameToBoxes < ActiveRecord::Migration[6.1]
  def change
    add_column :boxes, :name, :string
  end
end
