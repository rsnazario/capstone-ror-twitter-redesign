require 'rails_helper'

RSpec.describe 'Main Flow', type: :system do
  describe 'Integration test' do
    context 'main users flow' do
      it 'can create a users, posts and follow other users' do
        visit('/')

        # Register
        click_link 'Create Account'
        # Fill the fields
        fill_in('user[username]', with: 'crunchy')
        fill_in('user[fullname]', with: 'Crunchy Bacon')
        click_button 'Create Account'
        # Create a Tweet
        fill_in('text', with: 'I am Crunchy Bacon!').send_keys :enter
        sleep 2
        click_link 'Logout'

        # Register 2nd user
        # page.find_by_id('sign-up-link').click
        click_link 'Create Account'

        # Fill the fields
        fill_in('user[username]', with: 'salty')
        fill_in('user[fullname]', with: 'Salty Bacon')
        click_button 'Create Account'

        # send_keys :enter --> type enter after filling in
        fill_in('text', with: 'I am Salty Bacon!').send_keys :enter
        sleep 1
        page.find_by_id('follow-now').click
        sleep 3
      end
    end
  end
end
