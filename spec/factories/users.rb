FactoryGirl.define do
  factory :user do
    email 'example_user@ualberta.ca'
    password 'testpassword123'
    provider 'shibboleth'
    uid 'example_user@ualberta.ca'

    # TODO: When we add roles need something like below:
    # trait :admin do
    #   after(:create) { |user| user.add_role(:admin) }
    # end
  end
end
