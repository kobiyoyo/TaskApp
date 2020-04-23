require 'rails_helper'
require_relative '../support/login_form'
feature 'create task' do
  let(:user) { FactoryBot.create(:user, username: 'chubi') }
  let(:login_form) { LoginForm.new }
  background do
    login_form.visit_page.login_as(user)
  end
  scenario 'successfully' do
    expect(page).to have_content('Successfully logged in.')
    click_on('All my tasks')
    click_on('Add new')
    fill_in 'Name', with: 'Cars'
    fill_in 'Hours', with: 454
    click_on('Create Task')
    expect(page).to have_content('Task successfully created.')
  end
end
