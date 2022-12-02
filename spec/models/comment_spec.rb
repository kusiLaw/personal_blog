require 'rails_helper'

RSpec.describe Comment, type: :model do
  user_one = User.create(name: 'Bringht', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  user_two = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
  user_three = User.create(name: 'Peter', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

  post_one = Post.create(author: user_one, title: 'Hello', text: 'This is my first post')

  context 'Test Comment methods :' do
    it 'Comment should have no comments' do
      post_comment = post_one.comments_counter
      expect(post_comment).to be(0)
    end

    it 'Like should have at least 2 like' do
      Comment.create(post: post_one, author: user_two, text: 'Hi Tom!')
      Comment.create(post: post_one, author: user_three, text: 'Hi Tom comment')

      post_comment = post_one.comments_counter
      expect(post_comment).to be(2)
    end
  end
end
