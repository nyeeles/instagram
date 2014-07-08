class Post < ActiveRecord::Base
	has_attached_file :image, 
	storage: :s3,
	s3_credentials: {
		bucket: 'instagram_may',
		access_key_id: Rails.application.secrets.s3_access_key,
		secret_access_key: Rails.application.secrets.s3_secret_key
		},
	styles: { thumb: '300x300>'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :image

  belongs_to :user
end
