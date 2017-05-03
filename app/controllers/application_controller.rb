class ApplicationController < ActionController::API
  before_action :authenticate_request
  helper_method :current_account

  include Response

  private

  def authenticate_request
    render json: error_hash, status: 401 unless current_account
  end

  def current_account
    @current_account ||= AuthorizeApiRequest.call(request.headers).result
  end

  def error_hash
    { error: 'Not Authorized' }
  end
end
