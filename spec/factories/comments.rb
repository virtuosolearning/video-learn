FactoryBot.define do
  factory :comment do
    user { nil }
    lesson { nil }
    comment { "MyText" }
  end
end
