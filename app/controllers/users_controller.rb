class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @new_user = User.build(user_params)
    @new_user.save
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @followed_by = @user.ppl_followers
  end

  private
  def user_params
    params.require(:user).permit(:username, :fullname)
  end
end
