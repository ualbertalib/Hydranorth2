require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    let(:user) { build(:user) }

    it 'requires email' do
      expect(user).to validate_presence_of(:email)
    end

    it 'requires password' do
      expect(user).to validate_presence_of(:password)
    end

    it 'requires password confirmation' do
      expect(user).to validate_confirmation_of(:password)
    end

    it 'requires unique email' do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end
  end

  describe '#to_s' do
    it 'uses email as the default identifier when casting to string' do
      user = build(:user, email: 'john.doe@ualberta.ca')
      expect(user.to_s).to eq('john.doe@ualberta.ca')
    end
  end
end
