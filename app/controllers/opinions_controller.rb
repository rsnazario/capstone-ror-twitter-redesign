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
    curr
    @opinions = User.joins(:thoughts)
      .select('users.*, opinions.text')
      .order('users.created_at DESC')
  end

  private

  def opinions_params
    params.permit(:text)
  end
end
