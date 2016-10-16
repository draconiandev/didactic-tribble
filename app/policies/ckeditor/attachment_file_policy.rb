class Ckeditor::AttachmentFilePolicy
  attr_reader :person, :attachment

  def initialize(person, attachment)
    @person = person
    @attachment = attachment
  end

  def index?
    person.present?
  end

  def create?
    person.present?
  end

  def destroy?
    attachment.assetable_id == person.id
  end
end
