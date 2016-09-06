def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'fakeemail@blah.com'
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end

def sign_in_admin
  visit '/'
  click_link 'Log in'
  fill_in 'Email', with: 'admin@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end
