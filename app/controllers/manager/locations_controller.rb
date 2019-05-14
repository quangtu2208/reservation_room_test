class Manager::LocationsController < Manager::ApplicationController
  before_action :load_location, only: %i(edit update destroy show)

  def index
    @locations= Location.all.page(params[:page]).per Settings.page
  end

  def show; end

  def search
    @locations = SearchQuery.new(Location,search_params,Settings.search_fields.location).all.page(params[:page]).per Settings.page
    render :index
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params
    if @room.save
      flash[:success] = t(".created")
      redirect_to manager_locations_path
    else
      flash[:error] = t(".create_unsuccess")
      render :new
    end
  end

  def edit; end

  def update
    if @location.update location_params
      flash[:success] = t(".room_updated")
      redirect_to manager_locations_path
    else
      render :edit
    end
  end

  def destroy
    if @location.destroy
      flash[:success] = t(".room_deleted")
      redirect_to request.referrer
    else
      flash[:error] = t(".room_failed")
      redirect_to manager_locations_path
    end
  end

  private

  def location_params
    params.require(:location).permit Location::LOCATION_PARAMS
  end

  def search_params
    params.slice :content, :field
  end

  def load_location
    @location = Location.find_by id: params[:id]
    return if @location
    flash[:error] = t(".room_not_found")
    redirect_to manager_locations_path
  end
end
