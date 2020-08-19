require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'Tayo') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end

  context 'name should be valid' do
    it 'should require a name' do
      expect(FactoryBot.build(:user, name: '')).not_to be_valid
    end

    it 'should accept letters in name' do
      expect(FactoryBot.build(:user, name: 'Tayo')).to be_valid
    end
  end
end
