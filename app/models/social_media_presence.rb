class SocialMediaPresence < ActiveRecord::Base

  #
  # Relationships
  #
	belongs_to :business
	belongs_to :business_owner

  #
  # In effort to make this model extensible as possible, introduce
  # social_network enum to capture various social media outlets
  # whose implementations can be added in future.
  #
  enum social_network: [ :facebook, :linkedin, :yelp ]

  #
  # Validations (very minimal for implementation)
  #
  validates :uid, presence: true
  validates :provider, presence: true
  validates :social_media_site, presence: true, inclusion: { in: social_networks.keys }
  validate :mutually_exclusive_belongs_to_relationship

  #
  # Custom validation to ensure that SocialMediaPresence is associated
  # with either a Business or a BusinessOwner but not both (mutually exclusive).
  #
  def mutually_exclusive_belongs_to_relationship
    if (business.nil? && business_owner.nil?)
      errors.add(:business, "must be associated with either a business or a business_owner")
      errors.add(:business_owner, "must be associated with either a business or a business_owner")
    elsif (!business.nil? && !business_owner.nil?)
      errors.add(:business, "cannot be associated with both a business and a business_owner")
      errors.add(:business_owner, "cannot be associated with both a business and a business_owner")
    end
  end

end
