require 'rails_helper'

RSpec.describe Post, type: :model do
  user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.')

  user_test.save

  first_post = Post.create(author: user_test, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author: user_test, title: 'Hello-second', text: 'This is my second post')
  third_post = Post.create(author: user_test, title: 'Hello-third', text: 'This is my third post')
  last_post = Post.create(author: user_test, title: 'Hello-fourth', text: 'This is my fourth post')

  context 'Post properties could be validated:' do
    it 'Title must not be blank.' do
      first_post.title = nil
      expect(first_post).to_not be_valid
    end

    it 'Title must not exceed 250 characters.' do
      second_post.title = 'we ' * 260
      expect(second_post).to_not be_valid
    end

    it 'CommentsCounter must be an integer greater than or equal to zero' do
      count = first_post.comments_counter
      expect(count).to eq 0
    end

    it 'LikesCounter must be an integer greater than or equal to zero' do
      counter = second_post.likes_counter
      expect(counter).to eq 0
    end
  end

  context 'Test methods of Post:' do
    Comment.create(post: last_post, author: second_user, text: 'Hi Tom!')
    Comment.create(post: last_post, author: second_user, text: 'Hi Tom comment 2!')
    Comment.create(post: last_post, author: second_user, text: 'Hi Tom! comment 3')
    Comment.create(post: last_post, author: second_user, text: 'Hi Tom! comment 4')
    Comment.create(post: last_post, author: second_user, text: 'Hi Tom! comment 5')
    Comment.create(post: last_post, author: second_user, text: 'Hi Tom! comment 6')
    Comment.create(post: third_post, author: second_user, text: 'Hi Tom! comment 6')

    it 'posts_counter should have post' do
      post_count = user_test.posts_counter
      expect(post_count).to be(4)
    end
    it 'recent_comments should have 5 ' do
      post_count = last_post.retrieve_recent_comments.count
      expect(post_count).to be(5)
    end
    it 'recent_comments should have 1' do
      post_count = third_post.retrieve_recent_comments.count
      expect(post_count).to be(1)
    end
  end
end
