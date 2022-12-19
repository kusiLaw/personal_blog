require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
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
                              text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                            molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                            numquam blanditiis')
    @frank_post2 = Post.create(author: @frank, title: 'Frank Second Post',
                               text: 'laborum umquam blanditiis')

    @frank_post3 = Post.create(author: @frank, title: 'Frank third Post',
                               text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                            molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                            numquam blanditiis')

    @frank_post4 = Post.create(author: @frank, title: 'Frank fourth Post',
                               text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                             molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                             numquam blanditiis')

    Comment.create(post: @frank_post, author: @lilly,
                   text: 'Hi Frank!, psum dolor sit amet consectetur adipisicing')
    Comment.create(post: @frank_post, author: @vida,
                   text: 'Hello Frank!,harum nesciunt ipsum debitis quas aliquid')

    Like.create(post: @frank_post, author: @vida)

    visit user_posts_path(@frank) # /users/:user_id/posts
  end

  it "display user's profile picture" do
    expect(page).to have_css("img[src*='#{@frank.photo}']")
  end

  it "the user's username" do
    expect(page).to have_content @frank.name
  end

  it 'display the number of posts the user has written' do
    expect(page).to have_content "Number of posts: #{@frank.posts.size}"
  end

  it "display a post's title" do
    find("#post_body-#{@frank_post.id} h2").text
    expect(page).to have_content @frank_post.title
  end

  it 'display a post body' do
    find("#core-text-#{@frank_post2.id}").text
    expect(page).to have_content(@frank_post2.text)
  end

  it 'display a first comments on a post' do
    @frank_post.retrieve_recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'display number of comments for each post' do
    expect(page).to have_content("Comments: #{@frank_post.comments_counter}")
  end

  it 'display number of likes for each post' do
    expect(page).to have_content("Likes: #{@frank_post.likes_counter}")
  end

  it "click a post it redirects me to that post's show page" do
    find("#post_body-#{@frank_post.id} a").click
    expect(current_path).to match user_post_path(@frank, @frank_post)
  end
end
