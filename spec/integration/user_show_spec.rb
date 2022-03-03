require 'rails_helper'

RSpec.describe 'User Show page', type: :feature do
  describe 'User Show requirements' do
    before(:each) do
        User.create(
            name: 'akinlade temitope',
            id: 1,
            email: 'topea@yahoo.com',
            password: '123456',
            confirmed_at: Time.now,
            photo: '6087-9404984.png'
        )

        User.create(
            name: 'akinlade steven',
            id: 2,
            email: 'mckent@yahoo.com',
            password: '123456',
            confirmed_at: Time.now,
            photo: '6087-9404984.png'
        )

        
    
        users = User.all
        user_name = users[0].name
        user_id = users[0].id
        # Post.create(author: users[0], title: 'testing', text: 'just testing', likescounter: 0, commentscounter:0)
        6.times { |_post| Post.create(author: users[0], title: 'testing', text: 'just testing',likescounter: 0, commentscounter:0) }
        visit new_user_session_path
        fill_in 'user_email', with: 'mckent@yahoo.com'
        fill_in 'user_password', with: '123456'
        click_button 'Log in'
        visit root_path
        click_link user_name
        visit user_path(user_id)
        

    end
 
    it 'Log In, click on a user and see user image' do
        users_img = page.all('img')
         expect(users_img.length).to eql(1)        
    end

    it 'Log In, click on a user and see user name' do
        users = User.all
        user_name = users[0].name
         expect(page).to have_content(user_name)        
    end

    it 'Log In, click on a user and see number of user posts' do
        users = User.all
        user = users[0]
         expect(page).to have_content(user.postscounter)        
    end

    it 'Log In, click on a user and see first 3 posts' do
        users = User.all
        user = users[0]
        recent_post = user.recent3_posts
        recent_post.each do |post|
            expect(page).to have_content(post.title) 
        end          
    end

    it 'Log In, click on a user and see link to view all posts' do
         expect(page).to have_content('See all Posts')        
    end

    it 'Log In, click on a user and see link to view all posts' do
        expect(page).to have_content('See all Posts')        
   end

   it 'Log In, click on a user and click on link to view all posts' do
    users = User.all
    click_link 'See all Posts'
    expect(page).to have_current_path user_posts_path(users[0].id)      
end

  end
   
end