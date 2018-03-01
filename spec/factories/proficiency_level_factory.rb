FactoryBot.define do
  factory :proficiency_level do
    level                       {(1..10).to_a.sample      }
    sequence(:statement)        { |n| "Proficiency Level statement #{n}" }
    skill


    trait :with_achievement do
      after(:create) do |proficiency_level, _evaluator|
        create_list(:achievment, 10, student: student, proficiency_level: proficiency_level, name: "Achievment Name Goes Here", achievement: "Achievement Body Goes Here")
      end
    end
  end
end
