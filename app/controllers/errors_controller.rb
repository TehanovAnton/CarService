class ErrorsController < ApplicationController
  def error_404
    @message = 'Page not found'
    render 'errors/not_found'
  end
end
