require 'rails_helper'

RSpec.describe DashboardPolicy do

  let (:visitor) { create :person }
  let (:user) { create :person }
  let (:admin) { create :person, :admin }
  let (:editor) { create :person, :editor }
  let(:activity) { create :activity }

  subject { described_class }

  permissions :index? do
    it 'does not grant access to a visitor' do
      expect(DashboardPolicy).to_not permit(visitor)
    end
    it 'does not grant access to a user' do
      expect(DashboardPolicy).to_not permit(user)
    end
    it 'grants access to an editor' do
      expect(DashboardPolicy).to permit(editor)
    end
    it 'grants access to an admin' do
      expect(DashboardPolicy).to permit(admin)
    end
  end

  permissions :activity? do
    it 'does not grant access to a visitor' do
      expect(DashboardPolicy).to_not permit(visitor)
    end
    it 'does not grant access to a user' do
      expect(DashboardPolicy).to_not permit(user)
    end
    it 'grants access to an editor' do
      expect(DashboardPolicy).to permit(editor)
    end
    it 'grants access to an admin' do
      expect(DashboardPolicy).to permit(admin)
    end
  end

  permissions :destination? do
    it 'does not grant access to a visitor' do
      expect(DashboardPolicy).to_not permit(visitor)
    end
    it 'does not grant access to a user' do
      expect(DashboardPolicy).to_not permit(user)
    end
    it 'grants access to an editor' do
      expect(DashboardPolicy).to permit(editor)
    end
    it 'grants access to an admin' do
      expect(DashboardPolicy).to permit(admin)
    end
  end

  permissions :category? do
    it 'does not grant access to a visitor' do
      expect(DashboardPolicy).to_not permit(visitor)
    end
    it 'does not grant access to a user' do
      expect(DashboardPolicy).to_not permit(user)
    end
    it 'grants access to an editor' do
      expect(DashboardPolicy).to permit(editor)
    end
    it 'grants access to an admin' do
      expect(DashboardPolicy).to permit(admin)
    end
  end

  permissions :vendor? do
    it 'does not grant access to a visitor' do
      expect(DashboardPolicy).to_not permit(visitor)
    end
    it 'does not grant access to a user' do
      expect(DashboardPolicy).to_not permit(user)
    end
    it 'grants access to an editor' do
      expect(DashboardPolicy).to permit(editor)
    end
    it 'grants access to an admin' do
      expect(DashboardPolicy).to permit(admin)
    end
  end
end
