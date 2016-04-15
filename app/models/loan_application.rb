class LoanApplication < ActiveRecord::Base

  #
  # Relationships
  #
  belongs_to :business
	has_many :business_owners, through: :business

  #
  # Validations (very minimal for implementation)
  #
  validates :business, presence: true
  validates :requested_principle, presence: true,
    numericality: { only_integer: true, greater_than: 1000 }
  validates :requested_term_months, presence: true, inclusion: { in: LOAN_TERM_LENGTHS }
  validates :loan_mini_score, presence: true,
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates_date :application_date, present: true, on_or_before: Date.today

  #
  # Returns array of integers representing the acceptable
  # term lengths (in months)
  #
	def self.terms
		LOAN_TERM_LENGTHS
	end
end
