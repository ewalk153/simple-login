class ApplicationController < ActionController::Base
  helper_method :current_user
  protected

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def auth_required
    unless current_user
      flash[:alert] = "You must be logged in to access this"
      redirect_to root_url
    end
  end
end
