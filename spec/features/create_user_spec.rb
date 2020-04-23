require 'rails_helper'

feature 'create user' do
  scenario 'successfully' do
    visit(new_user_path)
    fill_in 'Username', with: 'felix'
    click_on('Create User')
    expect(page).to have_content('Felix')
  end
  scenario 'unsuccessfully' do
    visit(new_user_path)
    click_on('Create User')
    expect(page).to have_content("Username can't be blank")
  end
end
