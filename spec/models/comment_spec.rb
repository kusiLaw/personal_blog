
require 'rails_helper'

RSpec.describe Comment, type: :model do
  user_1 = User.create(name: 'Bringht', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  user_2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
  user_3 = User.create(name: 'Peter', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

  post_1 = Post.create(author: user_1, title: 'Hello', text: 'This is my first post')
  
  context 'Test Comment methods :' do
    it 'Comment should have no comments' do
      post_comment = post_1.comments_counter
      expect(post_comment).to be(0)
    end

    it 'Like should have at least 2 like' do
      Comment.create(post: post_1, author: user_2, text: 'Hi Tom!' )
      Comment.create(post: post_1, author: user_3, text: 'Hi Tom comment') 

      post_comment = post_1.comments_counter
      expect(post_comment).to be(2)
    end
  end
end
