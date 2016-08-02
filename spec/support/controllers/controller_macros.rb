module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:person]
      admin =  FactoryGirl.create(:person, :admin) # Using factory girl as an example
      sign_in admin
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:person]
      person = FactoryGirl.create(:person, :user)
      person.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in person
    end
  end
end