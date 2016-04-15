class BusinessOwner < ActiveRecord::Base

  #
  # Relationships
  #
	belongs_to :business
	has_many :social_media_presences

  #
  # Validations (very minimal for implementation)
  #
  validates :business, presence: true
  validates_date :birthdate, on_or_before: Date.today

end
