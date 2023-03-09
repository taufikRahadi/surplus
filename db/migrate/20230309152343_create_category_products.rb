class CreateCategoryProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :category_products do |t|
      t.references :products, foreign_key: true
      t.references :categories, foreign_key: true
      t.timestamps
    end
  end
end
