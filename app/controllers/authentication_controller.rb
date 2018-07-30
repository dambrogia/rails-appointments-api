class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  def authenticate
    token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
