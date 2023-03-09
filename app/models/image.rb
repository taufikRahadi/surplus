class Image < ApplicationRecord
  mount_uploader :file, ProductImageUploader

  has_many :products, class_name: "Product", foreign_key: "products_id"
end
