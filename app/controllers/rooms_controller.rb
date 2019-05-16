class RoomsController < ApplicationController
  before_action :load_room, only: %i(show)

  def index
    @rooms= Room.all.page(params[:page]).per Settings.page
  end

  def show; end

  private

  def room_params
    params.require(:room).permit(:name, :occupancy_limit)
  end

  def load_room
    @room = Room.find_by id: params[:id]
    return if @room
    flash[:error] = t(".room_not_found")
    redirect_to rooms_path
  end
end
