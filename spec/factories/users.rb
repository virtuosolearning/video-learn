FactoryBot.define do
  factory :user do
    email { |n| "user_#{n}@example.com" }
    password { 'password' }
  end
end
