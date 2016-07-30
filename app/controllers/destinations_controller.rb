#
class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_manager!, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]
  after_action :verify_authorized

  def index
    authorize Destination
    @destinations = Destination.all.paginate(page: params[:page], per_page: 4)
    prepare_meta_tags title: "Destinations", description: "Your next adventure could be in Mysore. Or Hyderabad. Perhaps in Jaipur. Or Delhi. And, of course, Goa. The world is waiting. Live the adventure you’ve always dreamt."
  end

  def new
    authorize Destination
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    authorize @destination
    if @destination.save
      flash[:success] = 'Destination has been created.'
      redirect_to destination_path(@destination)
    else
      flash.now[:alert] = 'Sorry! Destination could not been created.'
      render 'new'
    end
  end

  def show
    authorize @destination
    @activities = Activity.in_destination(@destination)
                          .includes(:destination, :categories)
                          .shuffle
                          .paginate(page: params[:page], per_page: 12)

    meta_tags_for(@destination)

    @hash = Gmaps4rails.build_markers(@destination) do |destination, marker|
      marker.lat destination.latitude
      marker.lng destination.longitude
    end

    if request.path != destination_path(@destination)
      redirect_to @destination, status: 301
    end
  end

  def edit
    authorize @destination
  end

  def update
    authorize @destination
    if @destination.update(destination_params)
      flash[:success] = 'Destination has been updated.'
      redirect_to destination_path(@destination)
    else
      flash.now[:alert] = 'Destination has not been updated.'
      render 'edit'
    end
  end

  def destroy
    authorize @destination
    @destination.destroy
    flash[:notice] = 'Destination has been deleted.'
    redirect_to destinations_path
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :description, :cover,
                                        :brief, :slug)
  end
end
