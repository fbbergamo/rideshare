class Api::ApiController < ActionController::Base
  respond_to :json
  def default_serializer_options
    {root: false}
  end
end
