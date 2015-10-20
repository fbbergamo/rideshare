module Responders::JsonResponder
  protected

  # simply render the resource even on POST instead of redirecting for ajax
  def api_behavior
    if post?
      display resource, :status => :created
    elsif put?
      display resource, :status => :ok
    else
      super
    end
  end
end
