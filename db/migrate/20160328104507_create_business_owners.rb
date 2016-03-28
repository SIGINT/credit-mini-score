class CreateBusinessOwners < ActiveRecord::Migration
  def change
    create_table :business_owners do |t|
      t.integer :business_id
      t.integer :percentage_ownership
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :email
      t.date :birthdate
      t.string :social_security_number
      t.string :drivers_license_number
      t.integer :estimated_liquid_assets
      t.integer :estimated_outstanding_debt
      t.string :gender

      t.timestamps null: false
    end
  end
end
