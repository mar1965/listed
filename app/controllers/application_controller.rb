class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    current_user_path
  end

  private

  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end
end
