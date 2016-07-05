#
class PersonPolicy < ApplicationPolicy
  attr_reader :current_person, :model

  def initialize(current_person, model)
    @current_person = current_person
    @person = model
  end

  def index?
    admin? || editor?
  end

  def show?
    admin? || editor? || @current_person == @person
  end

  def destroy?
    return false if @current_person == @person
    admin?
  end

  def admin?
    @current_person.admin?
  end

  def editor?
    @current_person.editor?
  end
end
