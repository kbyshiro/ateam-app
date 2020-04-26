class ApplicationController < ActionController::Base
    include Response
    #include ExceptionHandler
    def not_found
        head :not_found
    end
    
end
