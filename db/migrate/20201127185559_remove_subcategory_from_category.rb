class RemoveSubcategoryFromCategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :subcategory, :string
  end
end
