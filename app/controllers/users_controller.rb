class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end

end
