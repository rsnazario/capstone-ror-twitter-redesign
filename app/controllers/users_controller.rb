class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[index show]
  before_action :logged_out, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:current_user_id] = @user.id
      redirect_to opinions_path
    else
      redirect_back(fallback_location: root_path)
      flash[:error] = @user.errors.full_messages
    end
  end

  def index
    curr
    @users = User.all
    return unless params[:search]

    @search_term = params[:search]
    @users = @users.search_by(@search_term).limit(5)
  end

  def show
    curr
    @user = User.find_by(id: params[:id])
    @posts = @user.thoughts.includes(:author)
    @i_follow = @c.follows.includes(:followed)
    @user_follows = @user.follows.includes(:followed)
    @user_followed_by = @user.followers.includes(:follower)
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverImage)
  end
end
