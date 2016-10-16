#
class ArticlePolicy < ApplicationPolicy
  attr_reader :person, :article

  def initialize(person, record)
    @person = person
    @record = record
  end

  def index?
    true
  end

  def create?
    manager?
  end

  def new?
    create?
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    manager?
  end

  def destroy?
    person.try(:admin?)
  end

  def enquiries?
    manager?
  end

  private

  def manager?
    person.try(:editor?) || person.try(:admin?)
  end
end
