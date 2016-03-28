class Business < ActiveRecord::Base
	has_many :business_owners
	has_many :social_media_presence
end
