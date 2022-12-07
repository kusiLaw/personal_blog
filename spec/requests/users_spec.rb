require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before { get users_path }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render index template' do
      expect(response).to render_template('index')
    end

    it 'rendered index include text' do
      expect(response).to render_template('index')
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET #show' do
    before { get '/users/5' }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render index template' do
      expect(response).to render_template('show')
    end

    it 'rendered index include text' do
      expect(response).to render_template('show')
      expect(response.body).to include('Here is a details of a given user')
    end
  end
end
