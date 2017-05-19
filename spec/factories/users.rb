FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example_user_#{n}@ualberta.ca" }
    password 'testpassword123'

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :omniauth_user do
      transient do
        uid '123456'
        provider 'saml'
      end

      after(:create) do |user, evaluator|
        user.identities << create(
          :identity,
          provider: evaluator.provider,
          uid: evaluator.uid
        )
      end
    end
  end
end
