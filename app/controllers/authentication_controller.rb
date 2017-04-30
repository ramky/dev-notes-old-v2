class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    auth_service = new_auth_service.call

    if auth_service.success?
      render json: { auth_token: auth_service.result }
    else
      render json: { error: auth_service.errors }, status: :unauthorized
    end
  end

  def new_auth_service
    AuthenticateAccount.new(params[:email], params[:password])
  end
end
