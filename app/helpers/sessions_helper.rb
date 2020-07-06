module SessionsHelper
  def current_user
    current_user = User.find_by(id: cookies[:current_user_id])
    current_user
  end

  def not_logged_in?
    current_user.nil?
  end

  def authenticate_user
    return unless not_logged_in?

    flash[:notice] = 'Please Log In!'
    redirect_to root_path
  end

  def curr
    @c = current_user
  end
end
