class Admin::DashboardController < ApplicationController
  before_action :authenticate_manager!
  after_action :verify_authorized

  def index
    authorize :dashboard, :index?
    @activities = Activity.includes(:destination, :vendor, :categories).limit(100).order('created_at DESC')
    @categories = Category.limit(100).order('created_at DESC')
    @destinations = Destination.limit(100).order('created_at DESC')
    @vendors = Vendor.limit(100).order('created_at DESC')
    @enquiries = Enquiry.limit(100).order('created_at DESC').includes(:activity)
  end

  def activity
    authorize :dashboard, :activity?
    @activities = Activity.all.includes(:destination, :vendor, :categories).order('created_at DESC')
  end

  def category
    authorize :dashboard, :category?
    @categories = Category.all.order('created_at DESC')
  end

  def destination
    authorize :dashboard, :destination?
    @destinations = Destination.all.order('created_at DESC')
  end

  def vendor
    authorize :dashboard, :vendor?
    @vendors = Vendor.all.order('created_at DESC')
  end
end
