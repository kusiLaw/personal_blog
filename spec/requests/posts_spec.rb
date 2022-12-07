require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /index' do
#     it 'returns http success' do
#       get '/posts/index'
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before { get user_posts_path(:id) }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render index template' do
      expect(response).to render_template('index')
    end

    it 'rendered index include text' do
      expect(response).to render_template('index')
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show' do
    before { get '/users/1/posts/2' }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render index template' do
      expect(response).to render_template('show')
    end

    it 'rendered index include text' do
      expect(response).to render_template('show')
      expect(response.body).to include('Here is a details of posts for a given user')
    end
  end
end
