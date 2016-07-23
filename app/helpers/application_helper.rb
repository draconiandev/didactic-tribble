module ApplicationHelper
  def manager?
    person_signed_in? && current_person.admin? || person_signed_in? && current_person.editor?
  end
end
