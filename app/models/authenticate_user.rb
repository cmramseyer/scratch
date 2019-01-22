class AuthenticateUser

  attr_reader :token

  def initialize(username, password)
    @username = username
    @password = password
  end

  def run
    user = User.find_by_username(@username)
    raise RuntimeError.new "User not found" unless user
    raise RuntimeError.new "Password invalid" unless user.authenticate(@password)
    @token = JsonWebToken.encode(user_id: user.id)
    self
  end

end