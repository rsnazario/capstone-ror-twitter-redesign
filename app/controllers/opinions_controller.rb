class OpinionsController < ApplicationController
  before_action :authenticate_user

  def new
    @thought = Opinion.new
  end

  def create
    @opinion = current_user.thoughts.build(opinions_params)
    @opinion.save
    redirect_back(fallback_location: root_path)
  end

  def index
    @thoughts = Opinion.all
    timeline_posts
    curr
  end

  private

  def opinions_params
    params.permit(:text)
  end

  def timeline_posts
    @timeline_posts ||= current_user.friends_and_own_posts
  end
end
