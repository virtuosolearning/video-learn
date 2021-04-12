FactoryBot.define do
  factory :lesson do
    title { 'Powerpoint lesson 1' }
    video_link { 'https://www.youtube.com/embed/u7Tku3_RGPs' }
    is_powerpoint { true }
    course
  end
end
