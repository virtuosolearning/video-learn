require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe '.count' do
    it 'counts two lessons' do
      create_pair(:lesson)
      expect(Lesson.count).to eq(2)
    end
  end
end
