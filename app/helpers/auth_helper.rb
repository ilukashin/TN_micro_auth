module AuthHelper
  extend self
  
  def extracted_token(token)
    JwtEncoder.decode(token)
  rescue JWT::DecodeError
    {}
  end

end
