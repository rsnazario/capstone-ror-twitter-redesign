class FollowingsController < ApplicationController
  def new; end

  def create
    @follow = Following.create(friendship_params)
    # @follow = current_user.follows.build(followed_id: params[:id])
    # @follow.save
    redirect_back(fallback_location: root_path)
  end

  private

  def friendship_params
    params.permit(:follower_id, :followed_id)
  end
end
