#
RSpec.describe CategoryPolicy do

  let (:visitor) { create :person }
  let (:person) { create :person }
  let (:admin) { create :person, :admin }
  let (:editor) { create :person, :editor }
  let(:category) { create :category }

  subject { described_class }

  permissions :index? do
    it 'grants access to a visitor' do
      expect(CategoryPolicy).to permit(visitor, category)
    end
    it 'grants access to a person' do
      expect(CategoryPolicy).to permit(person, category)
    end
    it 'grants access to an editor' do
      expect(CategoryPolicy).to permit(editor, category)
    end
    it 'grants access to an admin' do
      expect(CategoryPolicy).to permit(admin, category)
    end
  end

  permissions :show? do
     it 'grants access to a visitor' do
      expect(CategoryPolicy).to permit(visitor, category)
    end
    it 'grants access to a person' do
      expect(CategoryPolicy).to permit(person, category)
    end
    it 'grants access to an editor' do
      expect(CategoryPolicy).to permit(editor, category)
    end
    it 'grants access to an admin' do
      expect(CategoryPolicy).to permit(admin, category)
    end
  end

  permissions :new?, :create? do
    it 'does not grant access to a visitor' do
      expect(CategoryPolicy).to_not permit(visitor, category)
    end
    it 'does not grant access to a person' do
      expect(CategoryPolicy).to_not permit(person, category)
    end
    it 'grants access to an editor' do
      expect(CategoryPolicy).to permit(editor, category)
    end
    it 'grants access to an admin' do
      expect(CategoryPolicy).to permit(admin, category)
    end
  end

  permissions :edit?, :update? do
    it 'does not grant access to a visitor' do
      expect(CategoryPolicy).to_not permit(visitor, category)
    end
    it 'does not grant access to a person' do
      expect(CategoryPolicy).to_not permit(person, category)
    end
    it 'grants access to an editor' do
      expect(CategoryPolicy).to permit(editor, category)
    end
    it 'grants access to an admin' do
      expect(CategoryPolicy).to permit(admin, category)
    end
  end

  permissions :destroy? do
    it 'does not grant access to a visitor' do
      expect(CategoryPolicy).to_not permit(visitor, category)
    end
    it 'does not grant access to a person' do
      expect(CategoryPolicy).to_not permit(person, category)
    end
    it 'does not grant access to an editor' do
      expect(CategoryPolicy).to_not permit(editor, category)
    end
    it 'grants access to an admin' do
      expect(CategoryPolicy).to permit(admin, category)
    end
  end
end
