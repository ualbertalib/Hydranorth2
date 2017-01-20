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

    it 'requires provider' do
      expect(user).to validate_presence_of(:provider)
    end
    it 'requires uid' do
      expect(user).to validate_presence_of(:uid)
    end

    it 'requires password confirmation' do
      expect(user).to validate_confirmation_of(:password)
    end

    it 'requires unique email' do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end

    it 'requires unique uid scoped by provider' do
      expect(user).to validate_uniqueness_of(:uid).scoped_to(:provider)
    end
  end

  context 'scopes' do
    describe '#to_s' do
      it 'uses email as the default identifier when casting to string' do
        user = build(:user, email: 'john.doe@ualberta.ca')
        expect(user.to_s).to eq('john.doe@ualberta.ca')
      end
    end

    describe '.from_omniauth' do
      it 'creates new user from omniauth' do
        example_auth_hash = OmniAuth::AuthHash.new(uid: 'example_user@ualberta.ca',
                                                   provider: 'shibboleth',
                                                   info: { email: 'example_user@ualberta.ca' })
        expect do
          user = described_class.from_omniauth(example_auth_hash)
          expect(user).to be_persisted
        end.to change { described_class.count }.by(1)
      end

      it 'finds user from omniauth if already exists' do
        user = create(:user)

        example_auth_hash = OmniAuth::AuthHash.new(uid: 'example_user@ualberta.ca',
                                                   provider: 'shibboleth',
                                                   info: { email: 'example_user@ualberta.ca' })
        expect do
          user = described_class.from_omniauth(example_auth_hash)
          expect(user).to be_persisted
        end.not_to change { described_class.count }
      end
    end
  end
end
