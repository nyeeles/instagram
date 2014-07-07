require 'spec_helper'

describe 'Instagram' do

	context 'without posts' do
		it 'has no posts' do
			visit '/posts'
			expect(page).to have_content 'No posts yet'
		end

		it 'cannot post without an image' do
			visit '/posts'
			fill_in 'Title', with: 'First post'
			fill_in 'Body', with: 'This is my first post, yay!'
			click_button 'Create Post'
			expect(page).to have_content 'Please attach an image'
		end
	end

	context 'with posts' do
		it 'can show posts' do
			post = Post.create(title:"My first post", body:"Here is some text",image_file_name: "old_man.jpg")
			visit '/posts'
			expect(page).to have_content 'My first post'
			expect(page).to have_content 'Here is some text'
		end	
	end

end