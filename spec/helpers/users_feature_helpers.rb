def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'fakeemail@blah.com'
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end
