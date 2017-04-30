class AuthorizeApiRequest
  prepend ApplicationService

  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  def user
    @user ||= account_from_decoded_auth_token if decoded_auth_token
    @user ||= (errors << { token: 'Invalid token' }) && nil
  end

  def account_from_decoded_auth_token
    Account.find(decoded_auth_token[:account_id])
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return auth_headers if headers['Authorization'].present?
    (errors << { token: 'Missing token' }) && return
  end

  def auth_headers
    headers['Authorization'].split(' ').last
  end
end
