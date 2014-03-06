class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ::Errno::ECONNREFUSED, :with => :server_not_found

  protect_from_forgery with: :exception

 private

  def server_not_found
  	render 'error'
  end
  	
  
end
