# config/initializers/action_controller_responder.rb
class CustomResponder < ActionController::Responder
  def json_resource_errors
    errors = resource.errors
    return if errors.blank?
    json = {}
    new_hash = errors.to_hash(true).map do |k, v|
      v.map do |msg|
        { id: k, title: msg }
      end
    end.flatten
    json[:errors] = new_hash
    json
  end
end
