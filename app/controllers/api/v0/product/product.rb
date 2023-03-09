class Api::V0::Product::Product < Grape::API
  resources :product do
    desc 'create product'
    params do
      requires :name, type: String
      requires :description, type: String
      requires :categories, type: Array[Integer]
      requires :images, type: Array do
        requires :file, type: Rack::Multipart::UploadedFile
      end
      optional :enable, type: Boolean, default: true
    end
    post '/' do
      ActiveRecord::Base.transaction do
        product = Product.create! name: params.name,
                                  description: params.description,
                                  enable: params.enable

        params.categories.each do |category|
          category_data = Category.find_by id: category, enable: true
          error!('Selected category was not exists', env['api.response.code'] = 422) unless category_data.present?

          CategoryProduct.create! products_id: product.id,
                                  categories_id: category
        end

        params.images.each_with_index do |image, index|
          img = Image.create! name: "product-#{product.name}-#{index + 1}-img", file: image.file, enable: true
          ImageProduct.create! images_id: img.id, products_id: product.id
        end

        present :product, product
      end
    end

    desc 'list all product'
    get '/' do
      products = Product.all

      present :products, products, with: Api::V0::Product::Entities::Product
    end

    desc 'product by id'
    params do
      requires :id, type: Integer
    end
    get '/:id' do
      product = Product.find_by id: params.id
      error!('Product not found', env['api.response.code'] = 422) unless product.present?

      present :product, product, with: Api::V0::Product::Entities::Product
    end

    desc 'update product'
    params do
      requires :id, type: String
      requires :name, type: String
      requires :description, type: String
      requires :categories, type: Array[Integer]
      requires :images, type: Array do
        requires :file, type: Rack::Multipart::UploadedFile
      end
      requires :enable, type: Boolean, default: true
    end
    put '/:id' do
      product = Product.find_by id: params.id
      error!('Product not found', env['api.response.code'] = 422) unless product.present?

      ActiveRecord::Base.transaction do
        product.category_products.delete_all
        product.image_products.delete_all

        params.categories.each do |category|
          category_data = Category.find_by id: category, enable: true
          error!('Selected category was not exists', env['api.response.code'] = 422) unless category_data.present?

          CategoryProduct.create! products_id: product.id,
                                  categories_id: category
        end

        params.images.each_with_index do |image, index|
          img = Image.create! name: "product-#{product.name}-#{index + 1}-img", file: image.file, enable: true
          ImageProduct.create! images_id: img.id, products_id: product.id
        end

        present :product, product
      end
    end

    desc 'delete product'
    params do
      requires :id, type: Integer
    end
    delete '/:id' do
      product = Product.find_by id: params.id
      error!('Product not found', env['api.response.code']) unless product.present?

      ActiveRecord::Base.transaction do
        product.category_products.delete_all
        product.image_products.delete_all
        product.delete

        present :status, true
      end
    end
  end
end
