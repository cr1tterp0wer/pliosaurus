class GroupusersController < ApplicationController

  def create
    groupuser  = GroupUserJoin.new(groupusers_params)
    groupuser.save
    flash[:errors] = groupuser.errors.full_messages
    redirect_to groups_url
  end
  
  def destroy
    group = Group.find(params[:id])
    current_user.groups.delete(group)
    redirect_to groups_url
  end

  private
  def groupusers_params
    params.permit(:user_id, :group_id)
  end
end
