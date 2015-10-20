module ApiHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def sign_up(object)
    current_session.header 'X_AUTH_TOKEN',  object.encrypted_token
  end

  def set_json
    {'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE'=> 'application/json'}
  end

end
