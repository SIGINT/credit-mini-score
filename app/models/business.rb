class Business < ActiveRecord::Base

  # Relationships
	has_many :business_owners
	has_many :social_media_presence

  # Validations
  validates :legal_name, presence: true
  validates :organization_type, presence: true, inclusion: { in: ORG_TYPES }
  validates_date :founded_date, on_or_before: Date.today


  def self.org_types
    ORG_TYPES
  end

end
