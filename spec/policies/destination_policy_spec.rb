#
RSpec.describe DestinationPolicy do
  let (:visitor) { create :person }
  let (:person) { create :person }
  let (:admin) { create :person, :admin }
  let (:editor) { create :person, :editor }
  let(:destination) { create :destination }

  subject { described_class }

  permissions :index? do
    it 'grants access to a visitor' do
      expect(DestinationPolicy).to permit(visitor, destination)
    end
    it 'grants access to a person' do
      expect(DestinationPolicy).to permit(person, destination)
    end
    it 'grants access to an editor' do
      expect(DestinationPolicy).to permit(editor, destination)
    end
    it 'grants access to an admin' do
      expect(DestinationPolicy).to permit(admin, destination)
    end
  end

  permissions :show? do
     it 'grants access to a visitor' do
      expect(DestinationPolicy).to permit(visitor, destination)
    end
    it 'grants access to a person' do
      expect(DestinationPolicy).to permit(person, destination)
    end
    it 'grants access to an editor' do
      expect(DestinationPolicy).to permit(editor, destination)
    end
    it 'grants access to an admin' do
      expect(DestinationPolicy).to permit(admin, destination)
    end
  end

  permissions :new?, :create? do
    it 'does not grant access to a visitor' do
      expect(DestinationPolicy).to_not permit(visitor, destination)
    end
    it 'does not grant access to a person' do
      expect(DestinationPolicy).to_not permit(person, destination)
    end
    it 'grants access to an editor' do
      expect(DestinationPolicy).to permit(editor, destination)
    end
    it 'grants access to an admin' do
      expect(DestinationPolicy).to permit(admin, destination)
    end
  end

  permissions :edit?, :update? do
    it 'does not grant access to a visitor' do
      expect(DestinationPolicy).to_not permit(visitor, destination)
    end
    it 'does not grant access to a person' do
      expect(DestinationPolicy).to_not permit(person, destination)
    end
    it 'grants access to an editor' do
      expect(DestinationPolicy).to permit(editor, destination)
    end
    it 'grants access to an admin' do
      expect(DestinationPolicy).to permit(admin, destination)
    end
  end

  permissions :destroy? do
    it 'does not grant access to a visitor' do
      expect(DestinationPolicy).to_not permit(visitor, destination)
    end
    it 'does not grant access to a person' do
      expect(DestinationPolicy).to_not permit(person, destination)
    end
    it 'does not grant access to an editor' do
      expect(DestinationPolicy).to_not permit(editor, destination)
    end
    it 'grants access to an admin' do
      expect(DestinationPolicy).to permit(admin, destination)
    end
  end
end
