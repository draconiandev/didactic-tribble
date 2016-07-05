require 'rails_helper'

RSpec.describe PersonPolicy do
  let (:current_person) { create :person }
  let (:other_person) { create :person, email: 'email@email.email' }
  let (:another_person) { create :person }
  let (:admin) { create :person, :admin }
  let (:editor) { create :person, :editor }

  subject { described_class }

  permissions :index? do
    it 'denies access if not an admin' do
      expect(subject).not_to permit(current_person)
    end
    it 'allows access for an admin' do
      expect(subject).to permit(admin)
    end
    it 'allows access for an editor' do
      expect(subject).to permit(editor)
    end
  end

  permissions :show? do
    it "prevents people from seeing another person's profile" do
      expect(subject).not_to permit(current_person, other_person)
    end
    it 'allows people to see their own profile' do
      expect(subject).to permit(current_person, current_person)
    end
    it 'allows an admin to see any profile' do
      expect(subject).to permit(admin)
    end
    it 'allows an editor to see any profile' do
      expect(subject).to permit(editor)
    end
  end

  permissions :destroy? do
    it "prevents deleting person's own profile" do
      expect(subject).not_to permit(current_person, current_person)
    end
    it 'allows an admin to delete any person' do
      expect(subject).to permit(admin, other_person)
    end
    it 'does not allow an editor to delete any person' do
      expect(subject).not_to permit(editor, other_person)
    end
  end
end
