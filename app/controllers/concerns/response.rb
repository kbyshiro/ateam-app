module Response
  extend ActiveSupport::Concern
  
  def pretty_json(obj, options = nil)
    render json: JSON.pretty_generate(obj.as_json(options))
  end
  
  def json_response(object, status = :ok)
    if action_name == "index" 
      object = object.select(:id,:title,:making_time,:serves,:cost)
      object = {recipes: object}
      
    elsif action_name =="show" 
      message = "Recipe details by id"
      object = object.attributes().except("id","created_at","updated_at")
      object = {message: message,recipe: object}
      
    elsif action_name =="create"
      message = "Successfully Created!"
      object = {message: message, params: params}
      
    elsif action_name == "delete"
      message = "Successfully Deleted!"
      object = {message: message}
      
    elsif action_name == "update"
      message = "Successfully Updated!"
      object = object.attributes().except("id","created_at","updated_at")
      object = {message: message, recipe: object}
    else 
      object = object.merge({status: status}) 
    end
    pretty_json object
  end
 
end