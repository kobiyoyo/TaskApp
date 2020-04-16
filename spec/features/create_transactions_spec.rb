require 'rails_helper'

feature 'create group' do 
    let(:user){FactoryBot.create(:user,username:'chubi')}
	scenario 'successfully'  do
		visit login_path
		fill_in 'Username' ,with: user.username
		within(".control") do
            click_on("Login")
        end
		expect(page).to have_content('Successfully logged in.')
		click_on('All my transactions')
		click_on('Add new')
		fill_in 'Name',with: 'Cars'
		fill_in 'Amount',with: 454
		fill_in 'Group',with: 1
		click_on('Create Transaction')
		expect(page).to have_content('Transaction successfully created.')

	end
end
