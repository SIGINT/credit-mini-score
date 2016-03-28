class LoanApplication < ActiveRecord::Base
	has_one :business
	has_many :business_owners, through: :business
end
