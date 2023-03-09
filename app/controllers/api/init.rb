class Api::Init < Grape::API
  require 'hashie'
  prefix 'api'
  error_formatter :json, ErrorFormatter
  formatter :json, SuccessFormatter

  include Grape::Extensions::Hashie::Mash::ParamBuilder
  include ExceptionHandler

  mount Api::V0::Routes
end
