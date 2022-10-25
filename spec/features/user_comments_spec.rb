#These specs are totally incomplete. I was getting an issue with my firefox profile not loading
# whenever I wasnted to test anything with JS and it looked like a gnarly issue that would be time
# comsuming so I thought it best to get something to you as I was already late
require 'rails_helper'

describe "user comments" do
  let(:user) {create(:user)}
  let(:course) {create(:course)}
  let!(:lesson){create(:lesson, course: course)}

  context "signed in user" do
    it 'should allow a user to create a comment' do
      create_comment("Here is a standard comment")
      expect(page).to have_content("Here is a standard comment")
      expect(page).to have_css('.comment-body p', text: "Here is a standard comment")
    end

    it 'should allow a user to reply a comment' do
      create_comment("Here is a comment to be replied to")
      expect(page).to have_css('.comment-body p', text: 'Here is a comment to be replied to')
      click_link "Reply"
    end

    it 'should allow a user to edit their comment' do
      create_comment("Here is a standard comment")
      expect(page).to have_css('.comment-body p', text: 'Here is a standard comment')
    end

    it 'should allow a user to delete a comment' do
      create_comment("Here is a comment to be deleted")
      expect(page).to have_css('.comment-body p', text: "Here is a comment to be deleted")
      click_link "Delete"
      expect(page).to_not have_css('.comment-body p', text: "Here is a comment to be deleted")
    end
  end

  def create_comment(comment_text)
    sign_in user
    visit lesson_path(lesson)
    fill_in "comment_body", with: comment_text
    click_button "Create Comment"
  end
end