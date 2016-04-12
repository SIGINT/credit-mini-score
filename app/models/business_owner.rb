class BusinessOwner < ActiveRecord::Base
	belongs_to :business
	has_many :social_media_presences

  # Validations
  validates_date :birthdate, on_or_before: 18.years.ago.to_date

end
