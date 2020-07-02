class OpinionsController < ApplicationController
  before_action :authenticate_user

  def new
    @thought = Opinion.new
  end

  def create
    @opinion = current_user.thoughts.build(opinions_params)
    @opinion.save
    redirect_to opinions_path
  end

  def index
    @thoughts = Opinion.all
    timeline_posts
  end

  private

  def opinions_params
    params.permit(:text)
  end

  def timeline_posts
    @timeline_posts ||= current_user.friends_and_own_posts
  end

  def yet_to_follow
    (User.all - current_user.ppl_following)
  end
end
