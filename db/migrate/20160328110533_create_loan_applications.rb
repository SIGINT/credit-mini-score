class CreateLoanApplications < ActiveRecord::Migration
  def change
    create_table :loan_applications do |t|
      t.string :business_id
      t.date :application_date
      t.integer :requested_principle
      t.integer :requested_term_months
      t.integer :loan_mini_score

      t.timestamps null: false
    end
  end
end
