class Post < ActiveRecord::Base
	has_attached_file :image, styles: { thumb: '300x300>'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :image

  belongs_to :user
end
