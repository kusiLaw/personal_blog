require 'rails_helper'

RSpec.describe 'User index: ', type: :feature do
  before(:each) do
    @vida = User.create(name: 'Vida', photo: 'https://media.istockphoto.com/id/856599656/photo/passport-picture-of-a-smiling-turkish-businesswoman.jpg?s=612x612&w=0&k=20&c=dgETy-9neViQs7SATDTOOa80QOhVFcLIomBFRxWVN_8=',
                        bio: 'Lawyer from Mexico.')
    @lilly = User.create(name: 'Lilly', photo: 'https://www.persofoto.com/images/vorher-nachher/passfoto-beispiel-nachher.jpg',
                         bio: 'Teacher from Poland.')

    visit users_path
  end

  it 'display the username of all users' do
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'displays profile picture of all user' do
    User.all.each do |_user|
      expect(page).to have_selector('a img')
    end
  end

  it 'displays number of posts each user has written' do
    User.all.each do |user|
      expect(page).to have_content "Number of posts: #{user.posts.size}"
    end
  end

  it 'redirects to user show page when a user is clicked' do
    find("#user-link-#{@vida.id}").click
    expect(current_path).to match user_path(@vida)
  end
end
