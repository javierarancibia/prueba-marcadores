class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subcategories do |t|
      t.string :name, defaut: "Sin definir"

      t.timestamps
    end
  end
end
