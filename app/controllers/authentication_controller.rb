class AuthenticationController < ActionController::API

  def authenticate
    authentication = AuthenticateUser.new(login_params[:username], login_params[:password]).run

    if authentication.token
     render json: { auth_token: authentication.token }
    else
     render json: { error: 'Something went wrong' }, status: :unauthorized
    end

  rescue RuntimeError => exc
    render json: { error: exc.message }, status: :unauthorized
  end

  private

  def login_params
    params.permit(:username, :password)
  end
  
end
