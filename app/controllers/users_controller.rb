class UsersController < ApplicationController
  before_action :require_logged_in!, only: [:show]

  def index
   @user = current_user
  end
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end

end
