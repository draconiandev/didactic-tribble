#
class ActivitiesController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    authorize Activity
    @activities = Activity.approved.recent.includes(:destination, :categories).paginate(page: params[:page], per_page: 15)
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
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity has been created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, notice: 'Activity has not been created.' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    authorize @activity
    @galleries = @activity.galleries.all
    @enquiry = @activity.enquiries.build

    @related_activities = Activity.approved.related_activities(@activity)
                                  .includes(:categories)
    # Refactor later
    # @nearby_activities =  Activity.where("id != '#{@activity.id}'")
    #                               .limit(3).includes(:destination, :categories)
    @nearby_activities = Activity.approved.nearby_activities(@activity)
    meta_tags_for(@activity)

    build_map

    if request.path != activity_path(@activity)
      redirect_to @activity, status: 301
    end
  end

  def edit
    authorize @activity
  end

  def update
    authorize @activity
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_path(@activity), notice: 'Activity has been updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, notice: 'Activity has not been updated.' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @activity
    @activity.destroy
    flash[:notice] = 'Activity has been deleted'
    redirect_to activities_path
  end

  def enquiries
    authorize Activity
    @activity = Activity.find(params[:activity_id])
    @enquiries = @activity.enquiries.order('created_at DESC')
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def build_map
    @hash = Gmaps4rails.build_markers(@activity) do |activity, marker|
      marker.lat activity.destination.latitude
      marker.lng activity.destination.longitude
    end
  end

  def activity_params
    params.require(:activity).permit(:title, :overview, :itinerary,
                                     :price, :start_date, :end_date, :cover,
                                     :handcrafted, :handcrafted_category,
                                     :difficulty, :brief, :slug, :published_at, :featured,
                                     :destination_id, :vendor_id, :approved,
                                     galleries_attributes: [:id, :activity_id,
                                      :image, :alt_text, :done, :_destroy],
                                      category_ids:[], categories_attributes: [:name])
  end
end
