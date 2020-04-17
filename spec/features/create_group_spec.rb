require 'rails_helper'

feature 'create group' do 
    let(:user){FactoryBot.create(:user,username:'chubi')}
	scenario 'successfully'  do
		visit login_path
		fill_in 'Username' ,with: user.username
        click_on("Login")
		expect(page).to have_content('Successfully logged in.')
		click_on('All groups')
		click_on('Create new')
		fill_in 'Name',with: 'Cars'
		select "lock",from:"group[icon]"
		click_on('Create Group')
		expect(page).to have_content('Group successfully created.')

	end
	scenario 'unsuccessfully (name = nil)'  do
		visit login_path
		fill_in 'Username' ,with: user.username
		click_on("Login")
		expect(page).to have_content('Successfully logged in.')
		click_on('All groups')
		click_on('Create new')
		select "Clock",from:"group[icon]"
		click_on('Create Group')
		expect(page).to have_content("Name can't be blank")

	end
	scenario 'unsuccessfully (icon = nil)'  do
		visit login_path
		fill_in 'Username' ,with: user.username
        click_on("Login")
		expect(page).to have_content('Successfully logged in.')
		click_on('All groups')
		click_on('Create new')
		fill_in 'Name',with: 'Cars'
		click_on('Create Group')
		expect(page).to have_content("Icon can't be blank")

	end
end
