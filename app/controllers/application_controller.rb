class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?


  
  def login!(user)
    s  = Session.new(user_id:user.id)
    s.save
    session[:session_token] = s.session_token
  end
  def logout!
    Session.sign_out_user(current_user.id)
    session[:session_token] = nil
  end

  def current_user
      id = Session.get_user_id_by_token( session[:session_token] )  
      User.find(id) unless id.nil?
  end

  def logged_in?
    !!current_user
  end
  

  #require logged in

end
