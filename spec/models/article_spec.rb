require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create(name: 'Tayo') }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
  end

  describe 'Associations' do
    it { should have_many(:article_categories) }
    it { should have_many(:votes) }
    it { should belong_to(:author) }
  end
end
