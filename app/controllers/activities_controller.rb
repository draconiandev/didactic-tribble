#
class ActivitiesController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    authorize Activity
    @activities = Activity.all.limit(24)
  end

  def new
    authorize Activity
    @activity = Activity.new
    @gallery = @activity.galleries.build
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    if @activity.save
      params[:galleries]['image'].each do |a|
        @gallery = @activity.galleries.create!(image: a, activity_id: @activity.id)
      end
      flash[:success] = 'Activity has been created.'
      redirect_to activity_path(@activity)
    else
      flash.now[:alert] = 'Sorry! Activity could not been created.'
      render 'new'
    end
  end

  def show
    @galleries = @activity.galleries.all
    authorize @activity
  end

  def edit
    authorize @activity
  end

  def update
    authorize @activity
    if @activity.update(activity_params)
      flash[:success] = 'Activity has been updated.'
      redirect_to activity_path(@activity)
    else
      flash.now[:alert] = 'Sorry! Activity has not been updated.'
      render 'new'
    end
  end

  def destroy
    authorize @activity
    @activity.destroy
    flash[:notice] = 'Activity has been deleted'
    redirect_to activities_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :overview, :itinerary,
                                     :price, :start_date, :end_date, :cover,
                                     :handcrafted, :handcrafted_category,
                                     :difficulty, :brief, :slug, :category_id,
                                     :destination_id,
                                     galleries_attributes: [:id, :activity_id,
                                      :image, :alt_text])
  end
end
