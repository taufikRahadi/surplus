class CategoryProduct < ApplicationRecord
  belongs_to :product, class_name: "Product", foreign_key: "products_id"
  belongs_to :category, class_name: "Category", foreign_key: "categories_id"
end
