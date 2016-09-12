FactoryGirl.define do
  factory :projects_language do
    association :project
    association :language
  end
end
