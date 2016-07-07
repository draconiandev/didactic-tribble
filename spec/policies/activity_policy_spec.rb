#
RSpec.describe ActivityPolicy do
  let (:visitor) { create :person }
  let (:user) { create :person }
  let (:admin) { create :person, :admin }
  let (:editor) { create :person, :editor }
  let(:activity) { create :activity }

  subject { described_class }

  permissions :index? do
    it 'grants access to a visitor' do
      expect(ActivityPolicy).to permit(visitor, activity)
    end
    it 'grants access to a user' do
      expect(ActivityPolicy).to permit(user, activity)
    end
    it 'grants access to an editor' do
      expect(ActivityPolicy).to permit(editor, activity)
    end
    it 'grants access to an admin' do
      expect(ActivityPolicy).to permit(admin, activity)
    end
  end

  permissions :show? do
     it 'grants access to a visitor' do
      expect(ActivityPolicy).to permit(visitor, activity)
    end
    it 'grants access to a user' do
      expect(ActivityPolicy).to permit(user, activity)
    end
    it 'grants access to an editor' do
      expect(ActivityPolicy).to permit(editor, activity)
    end
    it 'grants access to an admin' do
      expect(ActivityPolicy).to permit(admin, activity)
    end
  end

  permissions :new?, :create? do
    it 'does not grant access to a visitor' do
      expect(ActivityPolicy).to_not permit(visitor, activity)
    end
    it 'does not grant access to a user' do
      expect(ActivityPolicy).to_not permit(user, activity)
    end
    it 'grants access to an editor' do
      expect(ActivityPolicy).to permit(editor, activity)
    end
    it 'grants access to an admin' do
      expect(ActivityPolicy).to permit(admin, activity)
    end
  end

  permissions :edit?, :update? do
    it 'does not grant access to a visitor' do
      expect(ActivityPolicy).to_not permit(visitor, activity)
    end
    it 'does not grant access to a user' do
      expect(ActivityPolicy).to_not permit(user, activity)
    end
    it 'grants access to an editor' do
      expect(ActivityPolicy).to permit(editor, activity)
    end
    it 'grants access to an admin' do
      expect(ActivityPolicy).to permit(admin, activity)
    end
  end

  permissions :destroy? do
    it 'does not grant access to a visitor' do
      expect(ActivityPolicy).to_not permit(visitor, activity)
    end
    it 'does not grant access to a user' do
      expect(ActivityPolicy).to_not permit(user, activity)
    end
    it 'does not grant access to an editor' do
      expect(ActivityPolicy).to_not permit(editor, activity)
    end
    it 'grants access to an admin' do
      expect(ActivityPolicy).to permit(admin, activity)
    end
  end
end
