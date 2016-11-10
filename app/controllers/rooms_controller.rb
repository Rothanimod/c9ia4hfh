class RoomsController < ApplicationController
  before_action :find_room, only: [:edit, :update]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:notice] = 'Room was successfully updated'
      redirect_to rooms_path
    else
      render :edit
    end
  end

  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url, :price_per_night)
    end
    def find_room
      @room = Room.find(params[:id])
    end
end
