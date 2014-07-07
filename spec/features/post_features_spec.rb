require 'spec_helper'

describe 'Instagram' do

	context 'without posts' do
		it 'has no posts' do
			visit '/posts'
			expect(page).to have_content 'No posts yet'
		end
	end

	context 'with posts' do
		it 'can show posts' do
			post = Post.create(title:"My first post", body:"Here is some text")
			visit '/posts'
			expect(page).to have_content 'My first post'
			expect(page).to have_content 'Here is some text'
		end	
	end

end