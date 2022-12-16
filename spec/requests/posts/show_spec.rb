require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @test_user = User.create(name: 'Lilly',
                             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Handi.')

    @test_post = Post.create(author: @test_user,
                             title: 'Hello',
                             text: 'This is my test post')

    # user_post_path => /users/:user_id/posts/:id
    get user_post_path(@test_user, @test_post)
  end

  describe 'GET #show' do
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render index template' do
      expect(response).to render_template(:show)
    end
  end
end
