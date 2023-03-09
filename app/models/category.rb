class Category < ApplicationRecord
  has_many :products, class_name: "CategoryProduct", foreign_key: "categories_id"
end
