require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @vida = User.create(name: 'Vida', photo: 'https://media.istockphoto.com/id/856599656/photo/passport-picture-of-a-smiling-turkish-businesswoman.jpg?s=612x612&w=0&k=20&c=dgETy-9neViQs7SATDTOOa80QOhVFcLIomBFRxWVN_8=',
                        bio: 'Lawyer from Mexico.')
    @lilly = User.create(name: 'Lilly', photo: 'https://www.persofoto.com/images/vorher-nachher/passfoto-beispiel-nachher.jpg',
                         bio: 'Teacher from Poland.')
    @frank = User.create(name: 'Frank', photo: 'https://media.istockphoto.com/id/480286744/photo/portrait-of-a-german-businessman-with-beard.jpg?s=612x612&w=is&k=20&c=Tod5GAEkrKqPJfQBl8CxKAs9x3EZAMDUOfdUwbZ887g=',
                         bio: 'Engineer from UK.')

    @vida_post = Post.create(author: @vida, title: 'Story About Vida',
                             text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.')

    @frank_post = Post.create(author: @frank, title: 'Story About Frank',
                              text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia')
    @frank_post2 = Post.create(author: @frank, title: 'Frank Second Post',
                               text: 'laborum umquam blanditiis')

    Comment.create(post: @frank_post, author: @lilly,
                   text: 'Hi Frank!, psum dolor sit amet consectetur adipisicing')
    Comment.create(post: @frank_post, author: @vida,
                   text: 'Hello Frank!,harum nesciunt ipsum debitis quas aliquid')

    Like.create(post: @frank_post, author: @vida)

    visit user_post_path(@frank, @frank_post)
  end

  it "display post's title" do
    expect(page).to have_content @frank_post.title
  end

  it 'display who wrote the post' do
    expect(page).to have_content("#{@frank_post.title} by #{@frank_post.author.name}")
  end

  it 'display how many comments it has' do
    expect(page).to have_content("Comments: #{@frank_post.comments_counter}")
  end

  it 'display how many likes it has' do
    expect(page).to have_content("Likes: #{@frank_post.likes_counter}")
  end

  it 'display the post body' do
    find("#core-text-#{@frank_post.id}")
    expect(page).to have_content(@frank_post.text)
  end

  it 'display the username of each commentor' do
    @frank_post.comments.each do |comment|
      expect(page).to have_content comment.author.name
    end
  end

  it 'display the comment each commentor left' do
    @frank_post.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
