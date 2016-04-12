class BusinessesController < ApplicationController

  def show
    @business = Business.find(params[:id])
  end

  # Create action may be useful if creating/saving Business objects using AJAX
  def create
  end

  # Update action may be useful if updating/saving Business objects using AJAX
  def update
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
