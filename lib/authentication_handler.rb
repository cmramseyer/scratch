module AuthenticationHandler

  def authenticate_request
    @current_user = AuthorizeApiRequest.new(request.headers).run
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

end