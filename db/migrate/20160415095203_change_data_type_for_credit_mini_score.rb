class ChangeDataTypeForCreditMiniScore < ActiveRecord::Migration
  def change
    change_table :loan_applications do |t|
      t.change :loan_mini_score, :decimal
    end
  end
end
