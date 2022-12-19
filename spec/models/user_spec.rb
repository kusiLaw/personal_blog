require 'rails_helper'

RSpec.describe User, type: :model do
  user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.new(author: user_test, title: 'Hello', text: 'This is my first post')

  context 'User properties could be validated:' do
    it 'name should not be valid' do
      user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
      # user_test.save
      user_test.name = nil
      expect(user_test).to_not be_valid
    end

    it 'name should not be valid' do
      user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
      # user_test.save
      user_test.name = ''
      expect(user_test).to_not be_valid
    end

    it 'posts_counter should not be valid' do
      user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
      # user_test.save
      user_test.posts_counter = ''
      expect(user_test).to_not be_valid
    end
  end

  context 'Test methods of User:' do
    it 'User should have no post' do
      post_count = subject.recent_posts.count
      expect(post_count).to be(0)
    end

    it 'posts_counter should be valid' do
      user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
      first_post = Post.create(author: user_test, title: 'Hello', text: 'This is my first post')
      expect(user_test.recent_posts.count).to eql(1)
    end

    it 'User should have three recent post post' do
      user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')

      Post.create(author: user_test, title: 'Hello', text: 'This is my first post')
      Post.create(author: user_test, title: 'Hello-second', text: 'This is my second post')
      Post.create(author: user_test, title: 'Hello-third', text: 'This is my third post')
      Post.create(author: user_test, title: 'Hello-fourth', text: 'This is my fourth post')

      post_count = user_test.recent_posts.count
      expect(post_count).to be(3)
    end
  end
end
