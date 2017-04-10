class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    redirect_to root_path
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end

end
