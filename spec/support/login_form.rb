class LoginForm
  include Capybara::DSL
  def visit_page
    visit('/login')
    self
  end

  def login_as(user)
    fill_in 'Username', with: user.username
    click_on('Login')
    self
  end
end
