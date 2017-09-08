class UsersController < ApplicationController


  def index
   @user = current_user
  end

 def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)

   if @user.save
     login!(@user)
     redirect_to locations_url
   else
     flash[:errors] = @user.errors.full_messages
     redirect_to :new
   end
 end

 def destroy
 end

 private
 def user_params
   params.require(:user).permit(:username,:password)
 end

end
