# based on sufia/spec/models/ability_spec.rb
require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  # TODO: Add specs
  context 'a user with no roles' do
    let(:guest_abilities) { Ability.new(nil) }

    it'has proper permissions' do
    end
  end

  context 'a registered user' do
    let(:user) { create(:user) }
    let(:registered_abilities) { Ability.new(user) }

    it 'has proper permissions' do
    end
  end

  context 'a user in the admin group' do
    let(:admin) { create(:user, admin: true) }
    let(:admin_abilities) { Ability.new(admin) }

    it 'has proper permissions' do
    end
  end
end
