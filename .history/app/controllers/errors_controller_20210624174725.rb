class ErrorsController < ApplicationController
<<<<<<< HEAD
  layout 'error'
 
  def not_found
    render status: :not_found
  end
 
  def unprocessable_entity
    render status: :unprocessable_entity
  end
 
  def server_error
    render status: :server_error
  end
=======

    def not_found
        render status: 404
    end

    def server_error
        render status: 500
    end

    def unacceptable
        render status: 422
    end
>>>>>>> 223189ea3c306eaa65e98b84c5e821fe7048e027
end
