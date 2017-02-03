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
          uid: 'johndoe',
          info: {
            email: 'johndoe@ualberta.ca',
            name: 'John',
            last_name: 'Doe'
          }
        )

        expect { get :shibboleth }.to change { User.count }.by(1)
        user = User.last
        expect(user.display_name).to eq 'John Doe'
        expect(user.email).to eq 'johndoe@ualberta.ca'
        expect(user.provider).to eq 'shibboleth'
        expect(user.uid).to eq 'johndoe'
        expect(response).to redirect_to(::Sufia::Engine.routes.url_helpers.dashboard_index_path)
      end
    end

    context 'with invalid new user' do
      it 'raises and does not save user' do
        request.env['omniauth.auth'] = OmniAuth::AuthHash.new(
          provider: 'shibboleth',
          uid: 'johndoe',
          info: {
            email: nil
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
