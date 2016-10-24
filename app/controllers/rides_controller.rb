class RidesController < ApplicationController

  def create
    user = User.find(session[:user_id])
    # binding.pry
    attraction = Attraction.find(params[:id])
    ride = Ride.create(user_id: user.id, attraction_id: attraction.id)
    flash[:notice] = ride.take_ride
    redirect_to user_path(user)
  end

end
