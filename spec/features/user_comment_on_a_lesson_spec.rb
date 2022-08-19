require 'rails_helper'

RSpec.feature "User comment on a lesson", type: :feature do
  let(:user) {create(:user)}
  let(:course) {create(:course)}
  let!(:lesson){create(:lesson, course: course)}

  it 'allows the user to comment on a lesson' do
    sign_in user
    visit root_path
    click_link course.title
    click_link lesson.title
    fill_in :comment_comment, :with => 'My message'
    click_button('Create Comment')

    expect(find('.comments__comment--message')).to have_content('My message')
    expect(find('.comments__comment--name')).to have_content(user.email)
    expect(find('.flash.notice')).to have_content('Comment created successfuly')
  end
end

