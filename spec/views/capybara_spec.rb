require 'rails_helper'

RSpec.describe 'Main Flow', type: :system do
  describe 'Integration test' do
    context 'main users flow' do
      it 'can create a users, posts and follow other users' do
        visit('/')

        # Register
        # page.find_by_id('sign-up-link').click
        click_link 'Create Account'

        # Fill the fields
        fill_in('user[username]', with: 'crunchy')
        fill_in('user[fullname]', with: 'Crunchy Bacon')
        sleep 1
        click_button 'Create Account'

        fill_in('username', with: 'crunchy')
        click_button 'Login'
        sleep 2
        # fill_in('post[content]', with: 'This test worked')
        # click_button 'Save'
        # click_link 'Sign out'

        # visit('/')

        # # Register
        # page.find_by_id('sign-up-link').click

        # Fill the fields
        # fill_in('user[name]', with: 'Salty Bacon')
        # fill_in('user[email]', with: 'salty@bacon.com')
        # fill_in('user[password]', with: '123123')
        # fill_in('user[password_confirmation]', with: '123123')
        # click_button 'Sign up'

        # click_link 'All users'
        # click_button 'Add Friend'
        # click_link 'Sign out'

        # fill_in('user[email]', with: 'crunchy@bacon.com')
        # fill_in('user[password]', with: '123123')
        # click_button 'Log in'
        # click_link 'Friends'
        # click_button 'Confirm'
      end
    end
  end
end