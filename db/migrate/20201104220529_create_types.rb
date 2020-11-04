class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :theme
      t.string :link
      t.references :bookmark, foreign_key: true

      t.timestamps
    end
  end
end
