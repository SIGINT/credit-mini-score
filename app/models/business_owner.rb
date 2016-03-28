class BusinessOwner < ActiveRecord::Base
	belongs_to :business
	has_many :social_media_presences
end
