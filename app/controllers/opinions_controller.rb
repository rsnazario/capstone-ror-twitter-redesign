class OpinionsController < ApplicationController
  def new
    @thought = Opinion.new
  end

  def create
    @thought = current_user.thoughts.build(text: params[content])
    @thought.save
    redirect_to opinions_path
  end

  def index
    @thoughts = Opinion.all
  end
end
