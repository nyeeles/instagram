require 'spec_helper'

describe 'Instagram adding posts' do

	context 'logged in'do

		before(:each) do
			user = User.create(email: 'blah@bla.com', password: '12345678', password_confirmation: '12345678')
			user.posts.create(title: 'First post', body: 'This is my first post, yay!', image_file_name: 'old_man.jpg')
			login_as user
		end

		context 'can create posts' do

			it 'has a form' do
				visit '/posts'
				expect(page).to have_field 'Title'
				expect(page).to have_field 'Body'
				expect(page).to have_button 'Create Post'
			end

			it 'creates a post with title and body' do
				visit '/posts'
				attach_file 'Image', Rails.root.join('spec','images','old_man.jpg')
				click_button 'Create Post'
				expect(page).to have_content 'First post'
				expect(page).to have_content 'This is my first post, yay!'
			end

			it 'can add photos' do
				visit '/posts'
				attach_file 'Image', Rails.root.join('spec','images','old_man.jpg')
				click_button 'Create Post'
				expect(page).to have_css 'img.uploaded-pic'
			end

			it 'shows the user who posted it' do
				visit '/posts'
				attach_file 'Image', Rails.root.join('spec','images','old_man.jpg')
				click_button 'Create Post'
				expect(page).to have_content 'Posted by blah@bla.com'
			end
		end
	end

	context 'logged out' do

		it 'cannot post' do
			visit '/posts'
			fill_in 'Title', with: 'First post'
			fill_in 'Body', with: 'This is my first post, yay!'
			attach_file 'Image', Rails.root.join('spec','images','old_man.jpg')
			click_button 'Create Post'
			expect(page).to have_content 'You need to sign in or sign up before continuing.'
			expect(page).not_to have_content 'First post'
		end
	end
end