FactoryGirl.define do
  factory :user do
    email 'example_user@ualberta.ca'
    password 'testpassword123'
    provider 'shibboleth'
    uid 'example_user@ualberta.ca'

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
