FactoryGirl.define do
  factory :work, class: GenericWork do
    title ['Foo']

    transient do
      user { FactoryGirl.build(:user)}
    end

    after(:build) do |work, evaluator|
      work.apply_depositor_metadata(evaluator.user.user_key)
    end
  end
end
