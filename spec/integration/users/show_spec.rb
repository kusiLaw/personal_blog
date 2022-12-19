require 'rails_helper'

RSpec.describe 'User show: ', type: :feature do
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
                               text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                              molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                              numquam blanditiis')

    @frank_post3 = Post.create(author: @frank, title: 'Frank third Post',
                               text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                              molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                              numquam blanditiis')

    @frank_post4 = Post.create(author: @frank, title: 'Frank fourth Post',
                               text: 'psum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                               molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                               numquam blanditiis')

    Comment.create(post: @frank_post, author: @lilly,
                   text: 'Hi Frank!, psum dolor sit amet consectetur adipisicing ')
    Comment.create(post: @frank_post, author: @vida,
                   text: 'Hello Frank!,harum nesciunt ipsum debitis quas aliquid')

    visit user_path(@frank)
  end

  it "display  the user's profile picture" do
    expect(page).to have_css("img[src*='#{@frank.photo}']")
  end

  it "display user's username" do
    expect(page).to have_content(@frank.name)
  end

  it 'display the number of posts the user has written' do
    expect(page).to have_content "Number of posts: #{@frank.posts.size}"
  end

  it 'display users bio' do
    expect(page).to have_content @frank.bio
  end

  it 'display the users first 3 posts' do
    @frank.recent_posts.each do |post|
      find("#post_number-#{post.id} h2")
      expect(page).to have_content post.title
    end

    expect(@frank.recent_posts.count).to be(3)
  end

  it "display button that lets user view all of a user's posts" do
    expect(page).to have_link('See all posts')
  end

  it "click a user's post, it redirects me to that post's show page" do
    find("#post_number-#{@frank_post2.id} a").click
    expect(current_path).to match user_posts_path(@frank, @frank_post2)
  end

  it '"See all post" button redirects to posts index page' do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@frank)
  end
end
