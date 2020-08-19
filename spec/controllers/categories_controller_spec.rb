require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) do
    { name: 'La Liga', priority: 2 }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #show' do
    context 'if the capybara does not exist' do
      it 'is not a success' do
        begin
          get :show, id: -1
        rescue StandardError
          ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(:show)
      end
    end
  end
end
