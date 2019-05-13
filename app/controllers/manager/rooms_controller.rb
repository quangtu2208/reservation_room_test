class Manager::RoomsController < Manager::ApplicationController
  before_action :load_room, except: %i(new index create search)

  def index
    @rooms= Room.list.page(params[:page]).per Settings.page
  end

  def show; end

  def search
    @rooms = SearchService.new(Room,search_params,Settings.search_fields.room).all_records
      .page(params[:page]).per Settings.page
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = t(".created")
      redirect_to manager_rooms_path
    else
      flash[:error] = t(".create_unsuccess")
      render :new
    end
  end

  def edit; end

  def update
    if @room.update room_params
      flash[:success] = t(".room_updated")
      redirect_to manager_rooms_path
    else
      render :edit
    end
  end

  def destroy
    if @room.reservation_details.any?
      flash[:danger] = t(".room_had_reservation_detail")
      redirect_to request.referrer
    else
      if @room.destroy
        flash[:success] = t(".room_deleted")
        redirect_to request.referrer
      else
        flash[:error] = t(".room_failed")
        redirect_to manager_rooms_path
      end
    end
  end

  private

  def room_params
    params.require(:room).permit Room::ROOM_PARAMS
  end

  def search_params
    params.slice :content, :field
  end

  def load_room
    @room = Room.find_by id: params[:id]
    return if @room
    flash[:error] = t(".room_not_found")
    redirect_to manager_rooms_path
  end
end
