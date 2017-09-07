class SessionsController < ApplicationController


  def new
  end
  def create
    @user = User.find_by_credentials(session_params[:username],
                                    session_params[:password])
    unless @user.nil?
      login!(@user) 
      redirect_to new_user_url
    else
      flash[:errors] = ["INVALID CREDENTIALS!"] 
      render :new
    end
  end

  def destroy
    logout!
    render :new
  end

  private
  def session_params
    params.require(:user).permit(:username,:password)
  end

end
