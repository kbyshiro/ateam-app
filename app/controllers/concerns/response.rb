module Response
  extend ActiveSupport::Concern
  
  def pretty_json(obj, options = nil)
    render json: JSON.pretty_generate(obj.as_json(options))
  end
  
  
  def json_response_index(object, status = :ok)
    object = object.select(:id,:title,:making_time,:serves,:cost)
    object = {recipes: object}
    pretty_json object
  end
  
  def json_response_show(object)
    message = "Recipe details by id"
    object = object[:title,:making_time,:serves,:cost]
    object = {message: message,recipes: object}
    pretty_json object
  end
end