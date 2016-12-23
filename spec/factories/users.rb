FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.tld" }
    password 'testpassword123'

    # TODO: When we add roles need something like below:
    # trait :admin do
    #   after(:create) { |user| user.add_role(:admin) }
    # end
  end
end
