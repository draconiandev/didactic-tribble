#
class ActivitiesController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    authorize Activity
    @activities = Activity.latest(50).includes(:destination, :categories).paginate(page: params[:page], per_page: 3)
    prepare_meta_tags title: "Activities", description: "Experience 100+ activities from around the country"
  end

  def new
    authorize Activity
    @activity = Activity.new
    @gallery = @activity.galleries.build
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    if @activity.publish
      flash[:success] = 'Activity has been created.'
      redirect_to activity_path(@activity)
    else
      @activity.unpublish
      flash.now[:alert] = 'Sorry! Activity could not been created.'
      render 'new'
    end
  end

  def show
    @galleries = @activity.galleries.all
    @related_activities = Activity.where("id != '#{@activity.id}'")
                                  .limit(3).includes(:destination)
    @nearby_activities =  Activity.where("id != '#{@activity.id}'")
                                  .where("destination_id = '#{@activity.destination.id}'")
                                  .limit(3).includes(:destination)
    authorize @activity
    prepare_meta_tags(title: @activity.title,
                      description: @activity.brief,
                      image: @activity.cover.card.url,
                      twitter: {card: "summary_large_image"})
     @hash = Gmaps4rails.build_markers(@activity) do |activity, marker|
      marker.lat activity.destination.latitude
      marker.lng activity.destination.longitude
    end
  end

  def edit
    authorize @activity
  end

  def update
    authorize @activity
    @activity.assign_attributes(activity_params)
    if @activity.publish
      flash[:success] = 'Activity has been updated.'
      redirect_to activity_path(@activity)
    else
      @activity.unpublish
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
    if request.path != activity_path(@activity)
      redirect_to @activity, status: 301
    end
  end

  def activity_params
    params.require(:activity).permit(:title, :overview, :itinerary,
                                     :price, :start_date, :end_date, :cover,
                                     :handcrafted, :handcrafted_category,
                                     :difficulty, :brief, :slug, :published_at, :featured,
                                     :destination_id, :vendor_id,
                                     galleries_attributes: [:id, :activity_id,
                                      :image, :alt_text, :done, :_destroy],
                                      category_ids:[], categories_attributes: [:name])
  end
end
