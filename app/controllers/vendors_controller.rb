class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_manager!
  before_action :authenticate_admin!, only: [:destroy]
  after_action :verify_authorized

  def index
    authorize Vendor
    @vendors = Vendor.all.paginate(page: params[:page], per_page: 25)
  end

  def new
    authorize Vendor
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    authorize @vendor
    if @vendor.save
      flash[:success] = 'Vendor has been created.'
      redirect_to vendor_path(@vendor)
    else
      flash.now[:alert] = 'Sorry! Vendor could not be created.'
      render 'new'
    end
  end

  def show
    authorize @vendor
    @activities = Activity.in_vendor(@vendor).includes(:vendor)
                          .paginate(page: params[:page], per_page: 12)

    if request.path != vendor_path(@vendor)
      redirect_to @vendor, status: 301
    end
  end

  def edit
    authorize @vendor
  end

  def update
    authorize @vendor
    if @vendor.update(vendor_params)
      flash[:success] = 'Vendor has been updated.'
      redirect_to vendor_path(@vendor)
    else
      flash.now[:alert] = 'Sorry! Vendor could not be updated.'
      render 'edit'
    end
  end

  def destroy
    authorize @vendor
    @vendor.destroy
    flash[:notice] = 'Vendor has been deleted.'
    redirect_to vendors_path
  end

  private

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(:name, :contact_person, :address,
                                   :city, :pincode, :email, :phone,
                                   category_ids:[], categories_attributes: [:name])
  end
end
