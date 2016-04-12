class LoanApplication < ActiveRecord::Base

  # Relationships
  belongs_to :business
	has_many :business_owners, through: :business

  # Validations
  validates :business, presence: true
  validates :requested_principle, presence: true
  validates :requested_term_months, presence: true, inclusion: { in: LOAN_TERM_LENGTHS }
  validates_date :application_date, present: true, on_or_before: Date.today

	def self.terms
		LOAN_TERM_LENGTHS
	end
end
