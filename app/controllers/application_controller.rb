class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_account

  private

  def authenticate_request
    @current_account = AuthorizeApiRequest.call(request.headers).result
    render json: error_hash, status: 401 unless @current_account
  end

  def error_hash
    { error: 'Not Authorized' }
  end
end
