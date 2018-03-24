class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    user_id = session[:user_id]
    user_id && User.find(user_id)
  end

  def ensure_logged_in
    unless current_user
      flash[:alert] = 'Please log in'
      redirect_to new_sessions_url
    end
  end
end
