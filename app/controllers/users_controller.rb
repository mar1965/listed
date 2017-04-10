class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user = current_user
    redirect_to root_path
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end

end
