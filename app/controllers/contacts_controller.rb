class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Sorry! We could not deliver the message. Please try again'
      render :new
    end
  end
end
