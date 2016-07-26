describe GalleryPolicy do

   let (:visitor) { create :person }
  let (:person) { create :person }
  let (:admin) { create :person, :admin }
  let (:editor) { create :person, :editor }
  let(:gallery) { create :gallery }

  subject { described_class }

  permissions :index? do
    it 'grants access to a visitor' do
      expect(GalleryPolicy).to permit(visitor, gallery)
    end
    it 'grants access to a person' do
      expect(GalleryPolicy).to permit(person, gallery)
    end
    it 'grants access to an editor' do
      expect(GalleryPolicy).to permit(editor, gallery)
    end
    it 'grants access to an admin' do
      expect(GalleryPolicy).to permit(admin, gallery)
    end
  end

  permissions :show? do
     it 'grants access to a visitor' do
      expect(GalleryPolicy).to permit(visitor, gallery)
    end
    it 'grants access to a person' do
      expect(GalleryPolicy).to permit(person, gallery)
    end
    it 'grants access to an editor' do
      expect(GalleryPolicy).to permit(editor, gallery)
    end
    it 'grants access to an admin' do
      expect(GalleryPolicy).to permit(admin, gallery)
    end
  end

  permissions :new?, :create? do
    it 'does not grant access to a visitor' do
      expect(GalleryPolicy).to_not permit(visitor, gallery)
    end
    it 'does not grant access to a person' do
      expect(GalleryPolicy).to_not permit(person, gallery)
    end
    it 'grants access to an editor' do
      expect(GalleryPolicy).to permit(editor, gallery)
    end
    it 'grants access to an admin' do
      expect(GalleryPolicy).to permit(admin, gallery)
    end
  end

  permissions :edit?, :update? do
    it 'does not grant access to a visitor' do
      expect(GalleryPolicy).to_not permit(visitor, gallery)
    end
    it 'does not grant access to a person' do
      expect(GalleryPolicy).to_not permit(person, gallery)
    end
    it 'grants access to an editor' do
      expect(GalleryPolicy).to permit(editor, gallery)
    end
    it 'grants access to an admin' do
      expect(GalleryPolicy).to permit(admin, gallery)
    end
  end

  permissions :destroy? do
    it 'does not grant access to a visitor' do
      expect(GalleryPolicy).to_not permit(visitor, gallery)
    end
    it 'does not grant access to a person' do
      expect(GalleryPolicy).to_not permit(person, gallery)
    end
    it 'does not grant access to an editor' do
      expect(GalleryPolicy).to_not permit(editor, gallery)
    end
    it 'grants access to an admin' do
      expect(GalleryPolicy).to permit(admin, gallery)
    end
  end
end

