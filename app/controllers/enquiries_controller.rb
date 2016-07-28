class EnquiriesController < ApplicationController
  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(params[:enquiry])
    @enquiry.request = request
    if @enquiry.deliver
      flash.now[:success] = 'Thank you for your enquiry. We will get back soon to help you in your plans!'
    else
      flash.now[:error] = 'Sorry! We could not deliver the message. Please try again'
      render :new
    end
  end
end
