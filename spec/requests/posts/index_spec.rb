require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @test_user = User.create(name: 'Lilly',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Ghana.')
  end

  describe 'GET #index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:ok)
    end

    it 'render index template' do
      get '/users/'

      expect(response).to render_template('index')
    end
  end
end
