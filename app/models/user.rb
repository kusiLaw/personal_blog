class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

 # def get_recent_posts
 #     self.posts.order(:created_at).limit(3)
 # end
end