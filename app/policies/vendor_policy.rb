class VendorPolicy < ApplicationPolicy
  attr_reader :person, :vendor

  def initialize(person, record)
    @person = person
    @record = record
  end

  def index?
    manager?
  end

  def create?
    manager?
  end

  def new?
    create?
  end

  def show?
    manager?
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
end
