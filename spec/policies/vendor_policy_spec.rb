require 'rails_helper'

RSpec.describe VendorPolicy do
  let (:visitor) { create :person }
  let (:person) { create :person }
  let (:admin) { create :person, :admin }
  let (:editor) { create :person, :editor }
  let(:vendor) { create :vendor }

  subject { described_class }

   permissions :index? do
    it 'does not grant access to a visitor' do
      expect(VendorPolicy).to_not permit(visitor, vendor)
    end
    it 'does not grant access to a person' do
      expect(VendorPolicy).to_not permit(person, vendor)
    end
    it 'grants access to an editor' do
      expect(VendorPolicy).to permit(editor, vendor)
    end
    it 'grants access to an admin' do
      expect(VendorPolicy).to permit(admin, vendor)
    end
  end

  permissions :show? do
     it 'does not grant access to a visitor' do
      expect(VendorPolicy).to_not permit(visitor, vendor)
    end
    it 'does not grant access to a person' do
      expect(VendorPolicy).to_not permit(person, vendor)
    end
    it 'grants access to an editor' do
      expect(VendorPolicy).to permit(editor, vendor)
    end
    it 'grants access to an admin' do
      expect(VendorPolicy).to permit(admin, vendor)
    end
  end

  permissions :new?, :create? do
    it 'does not grant access to a visitor' do
      expect(VendorPolicy).to_not permit(visitor, vendor)
    end
    it 'does not grant access to a person' do
      expect(VendorPolicy).to_not permit(person, vendor)
    end
    it 'grants access to an editor' do
      expect(VendorPolicy).to permit(editor, vendor)
    end
    it 'grants access to an admin' do
      expect(VendorPolicy).to permit(admin, vendor)
    end
  end

  permissions :edit?, :update? do
    it 'does not grant access to a visitor' do
      expect(VendorPolicy).to_not permit(visitor, vendor)
    end
    it 'does not grant access to a person' do
      expect(VendorPolicy).to_not permit(person, vendor)
    end
    it 'grants access to an editor' do
      expect(VendorPolicy).to permit(editor, vendor)
    end
    it 'grants access to an admin' do
      expect(VendorPolicy).to permit(admin, vendor)
    end
  end

  permissions :destroy? do
    it 'does not grant access to a visitor' do
      expect(VendorPolicy).to_not permit(visitor, vendor)
    end
    it 'does not grant access to a person' do
      expect(VendorPolicy).to_not permit(person, vendor)
    end
    it 'does not grant access to an editor' do
      expect(VendorPolicy).to_not permit(editor, vendor)
    end
    it 'grants access to an admin' do
      expect(VendorPolicy).to permit(admin, vendor)
    end
  end
end
