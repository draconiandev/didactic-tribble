#
class PeopleController < ApplicationController
  before_action :set_person,            only: [:show, :destroy]
  before_action :authenticate_person!,  only: [:show]
  # before_action :authenticate_manager!, only: [:index]
  # after_action  :verify_authorized

  def index
    # authorize Person
    @people = Person.all
  end

  def show
    # authorize @person
  end

  def destroy
    # authorize @person
    @person.destroy
    redirect_to people_path, notice: 'The account was successfully deleted'
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end
end
