FactoryGirl.define do
  factory :vote do
    value { (1..6).to_a.sample }
    association :user
    association :project
  end
end
