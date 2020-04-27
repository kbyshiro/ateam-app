class ApplicationController < ActionController::API
    include Response
    include Test
    
    
    def not_found
      head :not_found
    end
end
