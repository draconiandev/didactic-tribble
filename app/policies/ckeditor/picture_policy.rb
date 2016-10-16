class Ckeditor::PicturePolicy
  attr_reader :person, :picture

  def initialize(person, picture)
    @person = person
    @picture = picture
  end

  def index?
    person.present?
  end

  def create?
    person.present?
  end

  def destroy?
    picture.assetable_id == person.id
  end
end
