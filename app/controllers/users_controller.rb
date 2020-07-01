class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'Invalid Registration. Please try again!'
    end
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
    params.require(:user).permit(:username, :fullname, :photo, :coverImage)
  end
end
