require 'rails_helper'

RSpec.describe Like, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.')

  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

  context 'Test Like methods :' do
    it 'Like should have no likes' do
      post_like = first_post.likes_counter
      expect(post_like).to be(0)
    end
    it 'Like should have at least one like' do
      Like.create(post: first_post, author: second_user)
      post_like = first_post.likes_counter
      expect(post_like).to be(1)
    end
  end
end
