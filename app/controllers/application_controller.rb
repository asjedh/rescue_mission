class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

  def authenticate!
    if !signed_in?
      flash[:notice] = 'You need to sign in if you want to do that!'
      redirect_to(new_session_path)
    end
  end

  helper_method :current_user, :authenticate!, :signed_in?
end
