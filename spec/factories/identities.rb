FactoryGirl.define do
  factory :identity do
    uid 'facebook-id-12345'
    provider 'facebook'
    association :user, factory: :user, strategy: :build
  end
end
