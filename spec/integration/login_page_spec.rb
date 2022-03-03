require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  describe 'Login Page requirements' do
    it 'has username and password inputs, and Log in button' do
      visit new_user_session_path
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
    end
 
    it 'submits without username and password inputs' do
        visit new_user_session_path
        sleep(1)
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
        click_button 'Log in'
        expect(page).to have_content('Invalid Email or password')
    end

    it 'has incorrect email and password' do
        user1 = User.create(
            name: 'akinlade temitope',
            id: 1,
            email: 'topea@yahoo.com',
            password: '123456',
            confirmed_at: Time.now
        )
              visit new_user_session_path
              fill_in 'user_email', with: user1.email
              fill_in 'user_password', with: '123466'
              click_button 'Log in'
              expect(page).to have_content('Invalid Email or password')
    end

    it 'Should sign in to root page' do
        user1 = User.create(
            name: 'akinlade temitope',
            id: 1,
            email: 'topea@yahoo.com',
            password: '123456',
            confirmed_at: Time.now
        )
              visit new_user_session_path
              fill_in 'user_email', with: user1.email
              fill_in 'user_password', with: '123456'
              click_button 'Log in'
              expect(page).to have_content('Signed in successfully.')
              expect(page).to have_current_path root_path
    end


  end
   

#    

#     it 'can log in with correct data' do
#       @first_user = User.create(name: 'Mark', photo: 'photos_url',
#                                 bio: 'Stuff about mark',
#                                 posts_counter: 0, email: 'mark@gmail.com',
#                                 password: '0123456', confirmed_at: Time.now)
#       visit new_user_session_path
#       fill_in 'user_email', with: @first_user.email
#       fill_in 'user_password', with: @first_user.password
#       click_button 'Log in'
#       expect(page).to have_content('Logout')
#     end
#   end
end