class LocationController < ApplicationController
  before_action :require_logged_in!
  def new
  end
  def create
    @location = Location.new(location_params)
                             
    @location.save
    flash[:errors] = @location.errors.full_messages
    redirect_to user_url(current_user)
  end
  
  private
  def location_params
    params.require(:user).permit(:user_id,:longitude,:latitude);
  end

end
