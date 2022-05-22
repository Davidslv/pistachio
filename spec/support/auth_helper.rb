module AuthHelper
  def headers(options = {})
    user = ENV['BASIC_AUTH_NAME']
    pw = ENV['BASIC_AUTH_PASSWORD']

    { HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(user,pw) }
  end
end
