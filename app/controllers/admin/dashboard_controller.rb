class Admin::DashboardController < ApplicationController
  def index
    @activities = Activity.all
    @categories = Category.all
    @destinations = Destination.all
    @vendors = Vendor.all
    @enquiries = Enquiry.all
  end

  def activity

  end

  def category
  end

  def destination
  end

  def vendor
  end
end
