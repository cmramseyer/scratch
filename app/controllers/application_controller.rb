class ApplicationController < ActionController::Base

  before_action :authenticate_request
  attr_reader :current_user
  
end
