#
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :person_not_authorized

  protected

  def authenticate_manager!
    redirect_to new_person_session_path unless admin? || editor?
  end

  def person_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def authenticate_admin!
    redirect_to new_person_session_path unless admin?
  end

  def pundit_user
    Person.find_by_id(current_person)
  end

  def admin?
    current_person && current_person.admin?
  end

  def editor?
    current_person && current_person.editor?
  end
end
