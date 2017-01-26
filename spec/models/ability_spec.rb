require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  context 'a user with no roles' do
    let(:guest_abilities) { Ability.new(nil) }

    it'has proper permissions' do
      expect(guest_abilities).not_to be_able_to(:read, :admin_dashboard)
      expect(guest_abilities).not_to be_able_to(:manage, :all)
    end
  end

  context 'a registered user' do
    let(:user) { create(:user) }
    let(:registered_abilities) { Ability.new(user) }

    it 'has proper permissions' do
      expect(registered_abilities).not_to be_able_to(:read, :admin_dashboard)
      expect(registered_abilities).not_to be_able_to(:manage, :all)
    end
  end

  context 'a user in the admin group' do
    let(:admin) { create(:user, :admin) }
    let(:admin_abilities) { Ability.new(admin) }

    it 'has proper permissions' do
      expect(admin_abilities).to be_able_to(:read, :admin_dashboard)
      expect(admin_abilities).to be_able_to(:manage, :all)
    end
  end
end
