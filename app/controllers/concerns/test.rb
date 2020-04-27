module Test
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      if action_name == "show"
        e.message = "Not Found by the id"
      end
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      if action_name == "create" or action_name =="update"
        e.message = "uncertain property, input title,making_time,serves,ingredients,cost"
      end
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end
end