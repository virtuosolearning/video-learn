require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.count' do
    it 'counts two users' do
      create_pair(:user)
      expect(User.count).to eq(2)
    end
  end
end
