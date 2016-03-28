class SocialMediaPresence < ActiveRecord::Base
	belongs_to :business
	belongs_to :business_owner
end
