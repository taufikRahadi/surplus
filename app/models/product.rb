class Product < ApplicationRecord
  has_many :image_products, class_name: 'ImageProduct', foreign_key: 'products_id'
  has_many :category_products, class_name: 'CategoryProduct', foreign_key: 'products_id'
end
