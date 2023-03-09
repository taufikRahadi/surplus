class Image < ApplicationRecord
  mount_uploader :file, ProductImageUploader
end
