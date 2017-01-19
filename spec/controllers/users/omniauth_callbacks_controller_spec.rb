require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  describe 'GET shibboleth' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    context 'with valid new user' do
      it 'creates new user' do
        request.env['omniauth.auth'] = OmniAuth::AuthHash.new(
          provider: 'shibboleth',
          uid: 'john.doe@example.com',
          info: {
            email: 'john.doe@example.com',
            display_name: 'John Doe'
          }
        )

        expect { get :shibboleth }.to change { User.count }.by(1)
        user = User.last
        expect(user.display_name).to eq 'John Doe'
        expect(user.email).to eq 'john.doe@example.com'
        expect(user.provider).to eq 'shibboleth'
        expect(user.uid).to eq 'john.doe@example.com'
      end
    end

    context 'with invalid new user' do
      it 'raises and does not save user' do
        request.env['omniauth.auth'] = OmniAuth::AuthHash.new(
          provider: 'shibboleth',
          uid: nil,
          info: {
            email: nil,
            display_name: nil
          }
        )

        expect { get :shibboleth }.to raise_error(
          ActiveRecord::RecordInvalid,
          "Validation failed: Email can't be blank"
        )
        expect(User.count).to be_zero
      end
    end
  end
end
