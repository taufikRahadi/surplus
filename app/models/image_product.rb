class ImageProduct < ApplicationRecord
  belongs_to :product, class_name: 'Product', foreign_key: 'products_id'
  belongs_to :image, class_name: "Image", foreign_key: "images_id"
end
