class Api::V1::ApiController < ActionController::API

  before_action :authenticate_request
  attr_reader :current_user

  include AuthenticationHandler

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { message: exception.message }, status: :not_found
  end
  
end
