RSpec.describe Identity do
  subject { build(:identity) }

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'fields' do
    it { is_expected.to respond_to(:provider) }
    it { is_expected.to respond_to(:uid) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:provider) }
  end
end
