class Api::V0::Category < Grape::API
  resources :category do
    desc 'list of categories'
    get '/' do
      present :categories, Category.all
    end

    desc 'create category'
    params do
      requires :name, type: String
      optional :enable, type: Boolean, default: true
    end
    post '/' do
      data = Category.create! name: params['name'], enable: params['enable']
      present :category, data
    end

    desc 'update category'
    params do
      requires :id, type: Integer
      requires :name, type: String
      requires :enable, type: Boolean
    end
    put '/:id' do
      category = Category.find_by id: params.id
      error!('Category not found', env['api.response.code'] = 422) unless category.present?

      category.update! name: params.name, enable: params.enable
      category.reload

      present :category, category
    end

    desc 'delete category'
    params do
      requires :id, type: Integer
    end
    delete '/:id' do
      category = Category.find_by id: params.id
      error!('Data not exists', env['api.response.code'] = 422) unless category.present?

      category.delete
      present :status, true
    end
  end
end
