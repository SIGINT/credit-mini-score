class BusinessOwner < ActiveRecord::Base

  #
  # Relationships
  #
	belongs_to :business
	has_many :social_media_presences

  #
  # Validations (very minimal for implementation)
  #
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :business, presence: true
  validates :percentage_ownership, presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }
  validates_date :birthdate, on_or_before: Date.today

end
