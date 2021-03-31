class AddCategoryToBoxes < ActiveRecord::Migration[6.1]
  def change
    add_column :boxes, :category, :string
  end
end
