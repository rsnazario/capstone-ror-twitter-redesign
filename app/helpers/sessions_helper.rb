module SessionsHelper
  def current_user
    current_user = User.find_by(id: cookies[:current_user_id])
    current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user
    unless logged_in?
      flash[:notice] = 'Please Log In!'
      redirect_to root_path
    end
  end
end
