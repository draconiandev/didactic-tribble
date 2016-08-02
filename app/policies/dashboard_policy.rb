class DashboardPolicy < ApplicationPolicy
  attr_reader :person, :model

  def initialize(person, record)
    @person = person
    @record = record
  end

  def index?
    manager?
  end

  def activity?
    manager?
  end

  def destination?
    manager?
  end

  def category?
    manager?
  end

  def vendor?
    manager?
  end

  def enquiry?
    manager?
  end

  private

  def manager?
    person.try(:editor?) || person.try(:admin?)
  end
end
