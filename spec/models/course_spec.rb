require 'rails_helper'

RSpec.describe Course, type: :model do
  describe '.count' do
    it 'counts two courses' do
      create_pair(:course)
      expect(Course.count).to eq(2)
    end
  end
end
