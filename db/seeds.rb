# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


NUM_BUSINESSES = 6
NUM_LOAN_APPLICATIONS = 12

CITY_STATES = [["Seattle", "WA"], ["New York", "NY"], ["San Diego", "CA"], ["Boston", "MA"], ["Austin", "TX"]]
BUSINESS_URLS = ["http://www.therhinoroomseattle.com/", "http://steelcactuspgh.com/", "http://www.mariospgh.com/"]

#
# Returns a random city and state pair (array of 2 strings)
#
def get_random_city_state
  CITY_STATES[rand(CITY_STATES.size)]
end

#
# Returns a random organizational type (i.e. LLC, CORPORTATION etc.)
#
def get_random_organization_type
  ORG_TYPES[rand(ORG_TYPES.size)]
end

#
# Returns random terms length (in months)
#
def get_random_terms_length
  LOAN_TERM_LENGTHS[rand(LOAN_TERM_LENGTHS.size)]
end

#
# Returns random date from between specified years_ago and Present Day
#
def get_random_date(years_ago)
  days_ago = (365 * years_ago)
  rand(days_ago).days.ago.to_date
end

#
# Returns random URL from BUSINESS_URLS
#
def get_random_business_url
  BUSINESS_URLS[rand(BUSINESS_URLS.size)]
end

#
# Create specified number of owners who have ownership in specified business
#
def create_owners(num_owners, business)
  owners = Array.new
  unallocated_percent = 100

  num_owners.times do |i|
    percent = (i + 1 == num_owners ? unallocated_percent : rand(unallocated_percent + 1))
    unallocated_percent = (unallocated_percent - percent)

    owner = BusinessOwner.create(
      first_name: "Owner-#{i}",
      last_name: (rand(1) == 0 ? "Smith" : "Fitzpatrick"),
      percentage_ownership: percent,
      email: "owner-#{i}@gmail.com",
      phone_number: "206-910-7865",
      birthdate: get_random_date(65),
      business_id: business.id)
    owners << owner
  end
  owners
end

def create_business
  city_state = get_random_city_state
  org_type = get_random_organization_type

  business = Business.create(
    legal_name: "My Small Business-#{org_type.downcase}-#{city_state[1]}",
    address: "#{rand(500)} Main St",
    city: city_state[0],
    state: city_state[1],
    zip: rand(99999),
    phone_number: "202-986-9437",
    estimated_annual_revenue: (100000 + rand(350000)),
    num_employees: (2 + rand(30)),
    organization_type: org_type,
    founded_date: get_random_date(30),
    business_url: get_random_business_url)
  business
end

#
# Returns an array of Business objects (with size NUM_BUSINESSES)
#
def create_businesses_and_owners
  businesses = Array.new

  NUM_BUSINESSES.times do
    business = create_business
    num_owners = (1 + rand(5))
    create_owners(num_owners, business)
    businesses << business
  end
  businesses
end

#
# Returns an array of LoanApplication objects (with size NUM_LOAN_APPLICATIONS)
#
def create_applications
  applications = Array.new
  businesses = create_businesses_and_owners

  NUM_LOAN_APPLICATIONS.times do |i|
    business = businesses[rand(businesses.size)]
    application = LoanApplication.create(
      application_date: get_random_date(5),
      requested_principle: (50000 + rand(750000)),
      requested_term_months: get_random_terms_length,
      business_id: business.id)
    applications << application
  end
  applications
end

create_applications
