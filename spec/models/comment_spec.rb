require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {create(:user)}
  let(:course) {create(:course)}
  let(:lesson) {create(:lesson, course: course)}

  describe '.create' do
    it 'creates a comment' do
      a_comment = Comment.new(user_id: user.id, lesson_id: lesson.id, comment: 'My comment')
      expect{a_comment.save}.to change{ Comment.count }.by(1)
    end

    it 'cannot create a comment without a text' do
      a_comment = Comment.new(user_id: user.id, lesson_id: lesson.id, comment: nil)
      allow(a_comment).to receive(:save!).and_raise(ActiveRecord::RecordInvalid)
    end
  end
end
