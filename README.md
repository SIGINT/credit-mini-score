# credit-mini-score

## Model (table) Relationships
* **LoanApplication**
 * Primary record with which app interacts
 * Computed mini score is stored as field as well as requested principle, requested loan terms etc
 * `belongs_to business`
* **Business** 
 * Stores information about a small business
 * legal name, org type, address, business url, num employees, est revenue etc.
 * `has_many business_owners`
 * `has_many social_media_presences`
* **BusinessOwner**
 * Stores information about a person or entity who has ownership in business
 * percentage ownership, first & last names, address, email, phone etc.
 * `belongs_to business`
 * `has_many social_media_presences`
* **SocialMediaPresence**
 * Used to capture social network presences of businesses (and possibly business owners)
 * Abstracted to support multiple types of social network connections (via OAuth)
 * `belongs_to business`
 * `belongs_to business_owner`
 
## Screenshots
* **New Application:** https://github.com/SIGINT/credit-mini-score/blob/master/screenshots/new-loan-application.png
* **Applications:** https://github.com/SIGINT/credit-mini-score/blob/master/screenshots/loan-applications.png
* **View Business:** https://github.com/SIGINT/credit-mini-score/blob/master/screenshots/business-view.png
