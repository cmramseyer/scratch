class AuthorizeApiRequest

  def initialize(headers = {})
    @headers = headers
  end

  def run
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  end

  private

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if @headers['Authorization'].present?
      # authorization headers examples
      # Authorization: Bearer mF_9.B5f-4.1JqM
      # Authorization: Basic abcdefghij.klmn.opqrst
      return @headers['Authorization'].split(' ').last
    else
      raise RuntimeError.new "Authorization header not present"
    end
    nil
  end
end