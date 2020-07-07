class FollowingsController < ApplicationController
  def new; end

  def create
    @follow = Following.create(friendship_params)
    redirect_back(fallback_location: root_path)
  end

  def index
    curr
    @follows_me = @c.followers.includes(:follower)
    @i_follow = @c.follows.includes(:followed)
  end

  def destroy
    @follow = Following.find(params[:id])
    @follow.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def friendship_params
    params.permit(:follower_id, :followed_id)
  end
end
