require 'rails_helper'
require_relative '../support/login_form'
feature 'create group' do 
    let(:user){FactoryBot.create(:user,username:'chubi')}
    let(:login_form) { LoginForm.new }
    background do
      login_form.visit_page.login_as(user)
    end
	scenario 'successfully'  do
		expect(page).to have_content('Successfully logged in.')
		click_on('All groups')
		click_on('Create new')
		fill_in 'Name',with: 'Cars'
		select "lock",from:"group[icon]"
		click_on('Create Group')
		expect(page).to have_content('Group successfully created.')

	end
	scenario 'unsuccessfully (name = nil)'  do
		expect(page).to have_content('Successfully logged in.')
		click_on('All groups')
		click_on('Create new')
		select "Clock",from:"group[icon]"
		click_on('Create Group')
		expect(page).to have_content("Name can't be blank")

	end
	scenario 'unsuccessfully (icon = nil)'  do

		expect(page).to have_content('Successfully logged in.')
		click_on('All groups')
		click_on('Create new')
		fill_in 'Name',with: 'Cars'
		click_on('Create Group')
		expect(page).to have_content("Icon can't be blank")

	end
end
