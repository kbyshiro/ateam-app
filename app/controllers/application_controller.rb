class ApplicationController < ActionController::API
    #inculde ExceptionHandler
    include Response
    include Test
    
    def not_found
      head :not_found
    end
end
