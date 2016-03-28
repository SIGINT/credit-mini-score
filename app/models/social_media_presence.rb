class SocialMediaPresence < ActiveRecord::Base

	belongs_to :business
	belongs_to :business_owner

	enum social_media_site: [ :facebook, :linkedin, :yelp ]
end
