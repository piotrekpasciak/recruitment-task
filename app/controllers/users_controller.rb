class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!
  before_action :set_user, only: [:destroy]

  def index
    @users = User.all
  end

  def destroy
    if @user.admin
      flash[:error] = "You're not allowed to delete user with privileges."
    else
      @user.destroy
      flash[:success] = 'You have successfully deleted user.'
    end

    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
