class GroupsController < ApplicationController

  before_action :require_logged_in!

  def index
    @groups = Group.all
  end
  def show
   @group = Group.find(params[:id])

  end

  def new
  end
  def create
   @group = Group.new(group_params)
   if @group.save
     redirect_to groups_url
   else
     flash[:errors] = @group.errors.full_messages
     render :new
   end
  end
  
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to user_url(current_user)
  end

  private
  def group_params
    params.require(:group).permit(:title)
  end

end





