require 'rails_helper'

feature 'create task' do 
    let(:user){FactoryBot.create(:user,username:'chubi')}
	scenario 'successfully'  do
		visit login_path
		fill_in 'Username' ,with: user.username
		click_on("Login")
		expect(page).to have_content('Successfully logged in.')
		click_on('All my tasks')
		click_on('Add new')
		fill_in 'Name',with: 'Cars'
		fill_in 'Hours',with: 454
		click_on('Create Task')
		expect(page).to have_content('Task successfully created.')

	end
end
