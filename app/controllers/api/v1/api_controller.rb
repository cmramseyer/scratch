class Api::V1::ApiController < ActionController::API

  before_action :authenticate_request
  attr_reader :current_user

  include AuthenticationHandler
  
end
