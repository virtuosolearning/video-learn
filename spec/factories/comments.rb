FactoryBot.define do
  factory :comment do
    user
    lesson
    comment { "My comment" }
  end
end
