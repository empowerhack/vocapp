include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :term do
    term_en { Faker::Hipster.sentence }
    context_en { Faker::Hipster.sentence }
  end
end
