require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  context 'User properties could be validated:' do
    it 'name should not be valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be valid' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'posts_counter should not be valid' do
      subject.posts_counter = ''
      expect(subject).to_not be_valid
    end

    it 'posts_counter should not be valid' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be valid' do
      subject.posts_counter = 7
      expect(subject).to be_valid
    end
  end

  context 'Test methods of User:' do
    it 'User should have no post' do
      post_count = subject.recent_posts.count
      expect(post_count).to be(0)
    end
    it 'User should have three rexent post post' do
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello-second', text: 'This is my second post')
      Post.create(author: subject, title: 'Hello-third', text: 'This is my third post')
      Post.create(author: subject, title: 'Hello-fourth', text: 'This is my fourth post')

      post_count = subject.recent_posts.count
      expect(post_count).to be(3)
    end
  end
end
