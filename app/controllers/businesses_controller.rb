class BusinessesController < ApplicationController

  #
  # GET /businesses/:id
  #
  def show
    @business = Business.find(params[:id])
  end

  #
  # Create action would be useful for creating/saving Business records using AJAX.
  # For simplicity, Business records are created as part of LoanApplication creation.
  #
  def create
    #
    # NO-OP
    #
  end

  # Update action would be useful if updating/saving Business records using AJAX
  def update
    #
    # NO-OP
    #
  end


  private

  #
  # Redirect to root_url when RecordNotFound
  #
  def catch_not_found
    yield
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, :flash => { :error => "Record not found." }
  end

end
