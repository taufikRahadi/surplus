class Api::V0::Routes < Grape::API
  include Config

  version 'v0', using: :path

  mount Api::V0::Category
  mount Api::V0::Product::Product
end
