class Api::V0::Product::Entities::Product < Grape::Entity
  expose :id
  expose :name
  expose :description
  expose :categories
  expose :images
  expose :created_at

  def categories
    object.category_products.map(&:category)
  end

  def images
    object.image_products.map(&:image)
  end
end