class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_counter
    post.update(comments_counter: author.posts_counter + 1)
  end


end