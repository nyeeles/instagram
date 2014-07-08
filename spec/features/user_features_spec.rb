require 'spec_helper'

describe 'User' do
	
	it 'can sign up' do
		visit '/users/sign_up' 
		fill_in 'Email', with: 'test@test.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_button 'Sign up'
		expect(current_path).to eq '/'
		expect(page).to have_content 'You have signed up successfully'
	end

	it 'can sign in' do
		user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
		visit '/users/sign_in'
		fill_in 'Email', with: 'test@test.com'
		fill_in 'Password', with: '12345678'
		click_button 'Sign in'
		expect(current_path).to eq '/'
		expect(page).to have_content "Signed in successfully."
	end

end