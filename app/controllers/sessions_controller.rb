class SessionsController < ApplicationController
  before_action :logged_out, only: %i[new create]

  def new; end

  def create
    if (userx = User.find_by(username: params[:username]))
      cookies[:current_user_id] = userx.id
      redirect_to opinions_path
    else
      redirect_back(fallback_location: root_path)
      flash[:error] = "Invalid/Unregistered Username"
    end
  end

  def destroy
    cookies.delete(:current_user_id)
    redirect_to root_path
  end
end
