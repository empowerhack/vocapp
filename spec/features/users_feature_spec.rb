require 'rails_helper'

feature 'User sign in/out' do
  context 'User not signed in on homepage' do
    it 'log in and and a sign up link present' do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Sign up')
    end

    it 'should not show logout link' do
      visit '/'
      expect(page).not_to have_link('Logout')
    end
  end

  context 'User signed in on homepage' do
    before do
      sign_up
    end

    it 'should show logout link' do
      visit '/'
      expect(page).to have_link('Logout')
    end

    it 'should not show login and sign up link' do
      visit '/'
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Sign up')
    end
  end
end
