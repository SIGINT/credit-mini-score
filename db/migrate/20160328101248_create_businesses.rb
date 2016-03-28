class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :legal_name
      t.string :employer_identification_number
      t.string :organization_type
      t.string :address
      t.string :city
      t.string :county
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.date :founded_date
      t.integer :estimated_annual_revenue
      t.string :business_url
      t.integer :num_employees
      t.datetime :updated_date

      t.timestamps null: false
    end
  end
end
