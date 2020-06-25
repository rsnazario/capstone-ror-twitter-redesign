class FollowingsController < ApplicationController
  def new; end

  def create
    @follow = current_user.follows.build(followed_id: params[:id])
    @follow.save
    redirect_back(fallback_location: root_path)
  end
end
