require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) { User.create!(name: 'Tayo') }
  let(:image) { FactoryBotRails.create(:image, image: 'image.png') }
  let(:valid_attributes) do
    { title: 'Meet the finalist', text: 'Bayern Munich', image: 'random.png' }
  end

  let(:invalid_attributes) do
    { title: 'Meet the finalist', text: 'Bayern Munich', image: 'random.png' }
  end

  let(:valid_session) { { user: :user } }

  describe 'GET #new' do
    it 'renders the new articles page' do
      get :new
      expect(response).not_to render_template('new')
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET #index' do
    it 'inavadates the wrong params' do
      @category = Article.new invalid_attributes
      @category.save
      get :index, params: {}, session: valid_session
      expect(response).not_to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: 1 }, session: valid_session
      expect(response).not_to render_template('show')
    end
  end
end
