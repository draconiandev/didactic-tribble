module ApplicationHelper
  def manager?
    person_signed_in? && current_person.admin? || person_signed_in? && current_person.editor?
  end

  def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}"
  end
end
