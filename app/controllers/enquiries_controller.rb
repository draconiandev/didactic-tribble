class EnquiriesController < ApplicationController
  def new
    @activity = Activity.find(params[:activity_id])
    @enquiry = Enquiry.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @enquiry = @activity.enquiries.build(enquiry_params)
    if person_signed_in?
      @enquiry.name = current_person.name
      @enquiry.email = current_person.email
    end
    @enquiry.request = request
    if @enquiry.deliver
      flash[:success] = 'Thank you for your enquiry. We will get back soon to help you in your plans!'
      redirect_to activity_path(@activity)
    else
      flash[:error] = 'Sorry! We could not deliver the message. Please try again'
      redirect_to activity_path(@activity)
    end
  end

  private

  def enquiry_params
    params.require(:enquiry).permit(:name, :phone, :email, :message, :nickname)
  end
end
