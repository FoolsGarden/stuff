helpers do
  def current_user
    if 
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end