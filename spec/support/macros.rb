def auth_header_set(account = nil)
  token = JsonWebToken.encode(account_id: account.id)
  header 'Authorization', token.to_s
end
