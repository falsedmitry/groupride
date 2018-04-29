class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
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
      redirect_to rides_url
    else
      render :new
    end
  end

  def join
    @user = User.find(current_user.id)
    @ride = Ride.find(params[:id])

    begin
      @ride.riders << @user
    rescue ActiveRecord::RecordNotUnique
      flash[:notice] = "You have already joined this ride!"
      redirect_to ride_url(@ride)
    rescue ActiveRecord::ActiveRecordError
      # handle other ActiveRecord errors
    rescue # StandardError
      # handle most other errors
    rescue Exception
      # handle everything else
      raise
    end


    # flash.now[:notice] = "Ride and Rider added."
  end

end
