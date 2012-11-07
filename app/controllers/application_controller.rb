class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
    unless User.find_by_id(session[:user_id])
      puts 'bla'
      redirect_to login_url, notice: 'Please log in'
    end
  end
end
