require 'rails_helper'

RSpec.feature "User watches a lesson", type: :feature do
  let(:user) {create(:user)}
  let(:course) {create(:course)}
  let!(:lesson){create(:lesson, course: course)}

  it 'allows the user to watch a lesson' do
    sign_in user
    visit root_path
    click_link course.title

    expect(page).to have_content(course.description)
    click_link lesson.title
    expect(find('iframe')[:src]).to eq(lesson.video_link)
  end
end
