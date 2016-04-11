# Load the Rails application.
require File.expand_path('../application', __FILE__)

#
# Acceptable organization types for Business model
#
ORG_TYPES = ["LLC", "Sole Proprietorship", "Partnership", "Corporation"]

#
# Valid term lengths (in months) for LoanApplication
#
LOAN_TERM_LENGTHS = [ 6, 12, 24, 36, 48, 96 ]

# Initialize the Rails application.
Rails.application.initialize!
