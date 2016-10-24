class AttractionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
    if User.find(session[:user_id]).admin != true
      redirect_to root_path
    end
  end

  def create
    @attraction = Attraction.create(attraction_params)
    # binding.pry
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
    end

end
