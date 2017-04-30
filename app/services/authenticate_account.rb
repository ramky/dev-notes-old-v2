class AuthenticateAccount
  prepend ApplicationService

  attr_accessor :email, :password

  def initialize(email, password)
    @email    = email
    @password = password
  end

  def call
    JsonWebToken.encode(account_id: account.id) if account
  end

  private

  def account
    account = Account.find_by(email: email)
    return account if account && account.authenticate(password)

    errors << { account_authentication: 'invalid credentials' }
    nil
  end
end
