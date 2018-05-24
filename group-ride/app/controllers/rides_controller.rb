class RidesController < ApplicationController
  before_action :load_ride, only: [:show, :edit, :update, :destroy]
  before_action :require_user_authority, only: [:edit, :update, :destroy]

  def index
    if params[:ride]
      @rides = Ride.search(params[:ride])
    else
      @rides = Ride.all
    end
  end

  def show
    @riders = @ride.riders
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new

    @ride.title = params[:ride][:title]
    @ride.date = params[:ride][:date]
    @ride.duration = params[:ride][:duration]
    @ride.distance = params[:ride][:distance]
    @ride.location = params[:ride][:location]
    @ride.intensity = params[:ride][:intensity]
    @ride.drop = params[:ride][:drop]
    @ride.number_of_riders = params[:ride][:number_of_riders]
    @ride.elevation_gain = params[:ride][:elevation_gain]
    @ride.description = params[:ride][:description]
    @ride.image = params[:ride][:image]
    @ride.organizer = current_user

    if @ride.save
      flash[:notice] = "Ride created!"
      redirect_to ride_url(@ride)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ride.title = params[:ride][:title]
    @ride.date = params[:ride][:date]
    @ride.duration = params[:ride][:duration]
    @ride.distance = params[:ride][:distance]
    @ride.location = params[:ride][:location]
    @ride.intensity = params[:ride][:intensity]
    @ride.drop = params[:ride][:drop]
    @ride.number_of_riders = params[:ride][:number_of_riders]
    @ride.elevation_gain = params[:ride][:elevation_gain]
    @ride.description = params[:ride][:description]
    @ride.image = params[:ride][:image]

    if @ride.save
      flash[:notice] = "Ride updated!"
      redirect_to ride_url(@ride)
    else
      flash[:error] = "Something went wrong: ride#update failed."
      render :edit
    end
  end

  def destroy
    @ride.destroy
    flash[:notice] = "Ride deleted."
    redirect_to rides_url
  end

  def join
    @user = User.find(current_user.id)
    @ride = Ride.find(params[:id])

    begin
      @ride.riders << @user
    rescue ActiveRecord::RecordNotUnique
      flash[:notice] = "You have already joined this ride!"
    end

    redirect_to ride_url(@ride)
  end

  def leave
    @user = User.find(current_user.id)
    @ride = Ride.find(params[:id])

    @ride.riders.delete(@user)
    flash[:notice] = "You are no longer part of this ride."

    redirect_to ride_url(@ride)
  end

  def load_ride
    @ride = Ride.find(params[:id])
  end

  def require_user_authority
    unless current_user == @ride.organizer
      flash[:alert] = "You are not authorized to modify this ride."
      redirect_to login_url
    end
  end

end
