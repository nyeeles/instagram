require 'spec_helper'

describe 'Instagram' do
	
	context 'can create posts' do

		it 'has a form' do
			visit '/posts'
			expect(page).to have_field 'Title'
			expect(page).to have_field 'Body'
			expect(page).to have_button 'Create Post'
		end

		it 'creates a post with title and body' do
			visit '/posts'
			fill_in 'Title', with: 'First post'
			fill_in 'Body', with: 'This is my first post, yay!'
			click_button 'Create Post'
			expect(page).to have_content 'First post'
			expect(page).to have_content 'This is my first post, yay!'
		end

		it 'can add photos' do
			visit '/posts'
			fill_in 'Title', with: 'First post'
			fill_in 'Body', with: 'This is my first post, yay!'
			attach_file 'Image', Rails.root.join('spec','images','old_man.jpg')
			click_button 'Create Post'
			expect(page).to have_css 'img.uploaded-pic'
		end
	end
end