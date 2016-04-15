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
  validates :num_connections, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :social_media_site, presence: true, inclusion: { in: social_networks.keys }
  validate :mutually_exclusive_belongs_to_relationship

  #
  # Scopes
  #
  scope :by_num_connections, -> { order('num_connections') }
  scope :with_num_connections_less_than, -> (num) { where('num_connections < ?', num) }
  scope :for_business, -> (business_id) { where business_id: business_id }

  #
  # Compared to all other SocialMediaPresence records, calculate this
  # record's num_connections percentile.
  #
  def calculate_num_connections_percentile

    # Get all SocialMediaPresence records having num_connections less than this record
    lower_num_connections_count = SocialMediaPresence.with_num_connections_less_than(num_connections).size

    n = SocialMediaPresence.all.size
    percentile = (100 * (lower_num_connections_count.to_f / n))
  end

  #
  # Custom validation to ensure that SocialMediaPresence is associated
  # with either a Business or a BusinessOwner but not both (mutually exclusive).
  #
  def mutually_exclusive_belongs_to_relationship
    if (business.nil? && business_owner.nil?)
      errors.add(:business_id, "must be associated with either a business or a business_owner")
      errors.add(:business_owner, "must be associated with either a business or a business_owner")
    elsif (!business.nil? && !business_owner.nil?)
      errors.add(:business, "cannot be associated with both a business and a business_owner")
      errors.add(:business_owner, "cannot be associated with both a business and a business_owner")
    end
  end

end
