include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :term do
    term_en { Faker::Hipster.sentence }
    term_ar { Faker::Hipster.sentence }
    ac_field_en { Faker::Hipster.sentence }
    ac_field_ar { Faker::Hipster.sentence }
    definition_en { Faker::Hipster.sentence }
    definition_ar { Faker::Hipster.sentence }
    context_en { Faker::Hipster.sentence }
    context_ar { Faker::Hipster.sentence }
  end
end
