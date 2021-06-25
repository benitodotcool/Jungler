class ErrorsController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> dbd5b27bb95c764a2eed7463eeaff9fcbac1030b

    def not_found
        render status: 404
    end

    def server_error
        render status: 500
    end

    def unacceptable
        render status: 422
    end

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

