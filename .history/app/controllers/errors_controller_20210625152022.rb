class ErrorsController < ApplicationController


    def not_found
        render status: 404
    end

    def server_error
        render status: 500
    end

    def unacceptable
        render status: 422
    end

 
 
  def not_found
    render status: :not_found
  end
 
  def unprocessable_entity
    render status: :unprocessable_entity
  end
 
  def server_error
    render status: :server_error
  end

