#
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_manager!, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]
  after_action :verify_authorized

  def index
    authorize Category
    @categories = Category.all.paginate(page: params[:page], per_page: 4)
    prepare_meta_tags title: "Categories", description: "Your next adventure could be in Mysore. Or Hyderabad. Perhaps in Jaipur. Or Delhi. And, of course, Goa. The world is waiting. Live the adventure you’ve always dreamt."
  end

  def new
    authorize Category
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      flash[:success] = 'Category has been created.'
      redirect_to category_path(@category)
    else
      flash.now[:alert] = 'Sorry! Category could not been created.'
      render 'new'
    end
  end

  def show
    authorize @category
    @activities = @category.activities
                           .includes(:destination, :categories)
                           .uniq.sort_by(&:id)
                           .paginate(page: params[:page], per_page: 12)

    meta_tags_for(@category)
    
    if request.path != category_path(@category)
      redirect_to @category, status: 301
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      flash[:success] = 'Category has been updated.'
      redirect_to category_path(@category)
    else
      flash.now[:alert] = 'Category has not been updated.'
      render 'edit'
    end
  end

  def destroy
    authorize @category
    @category.destroy
    flash[:notice] = 'Category has been deleted.'
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :cover,
                                     :brief, :main_category, :slug)
  end
end
