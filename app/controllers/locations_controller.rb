class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update]

  def index
    @locations = current_user.locations
  end

  def show
    @pictures = @location.pictures
    @reviews = @location.reviews
    @rooms = @location.rooms
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
    @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(location_params)

    if @location.save

      if params[:pictures]
        params[:pictures].each do |picture|
          @locations.pictures.create(picture: picture)
        end
      end

      @pictures = @locations.pictures
      redirect_to edit_location_path(@location), notice: "Saved..."
    else
      render :new
    end
  end

  def edit
    if current_user.id == @location.user.id
      @pictures = @location.pictures
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @location.update(location_params)

      if params[:pictures]
        params[:pictures].each do |picture|
          @location.pictures.create(picture: picture)
        end
      end

      redirect_to edit_location_path(@location), notice: "Updated..."
    else
      render :edit
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :national, :zip_code, :description, :status, :location_type_id, :user_id, :created_at, :updated_at, pictures: [])
    end
end
