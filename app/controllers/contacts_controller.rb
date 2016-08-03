class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    prepare_meta_tags title: 'Contact Us', description: 'TrekHub Contact Page'
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if person_signed_in?
      @contact.name = current_person.name
      @contact.email = current_person.email
    end
    if @contact.deliver
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
      redirect_to contact_path
    else
      flash[:error] = 'Sorry! We could not deliver the message. Please try again'
      redirect_to contact_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :message, :nickname)
  end
end
