class LoanApplicationsController < ApplicationController

  around_filter :catch_not_found

  #
  # PUT /applications/:id
  #
  def create
    @application = LoanApplication.new(loan_application_params)
    @business = Business.new(business_params)

    #
    # For simplicity, let's just consider one associated BusinessOwner
    # record first. The model relationships to support multiple
    # BusinessOwners records are in place though.
    #
    @owner = BusinessOwner.new(owner_params)
    @owner.business = @business
    @owners = [ @owner ]
    @application.business = @business
    @application.application_date = Date.today

    respond_to do |format|

      #
      # Attempt to save LoanApplication, Business, and BusinessOwner records.
      #
      app_saved = @application.save
      business_saved = @business.save
      owner_saved = @owner.save

      if (app_saved && business_saved && owner_saved)
        flash[:success] = 'Loan application was successfully submitted.'
        format.html { redirect_to @application }
        format.json { render :show, status: :created, location: @application }
      else
        #
        # When attempting to save LoanApplication, Business, and BusinessOwner
        # records, treat them together as an "all-or-nothing" operation. Destroy
        # all records if any single one fails to save.
        #
        if app_saved
          @application.destroy
        end

        if business_saved
          @business.destroy
        end

        if owner_saved
          @owner.destroy
        end
        flash[:danger] = 'There was a problem submitting application'
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #
    # NO-OP for simplicity
    #
  end

  #
  # GET /applications/new
  #
  def new
    @application = LoanApplication.new
    @business = @application.build_business
    @owner = @application.business_owners.build
    @owners = [ @owner ]
  end

  #
  # GET /applications/:id
  #
  def show
    @loan_application = LoanApplication.find(params[:id])
    @business = @loan_application.business
    @owners = @business.business_owners
  end

  #
  # GET /applications
  #
  def index
    @loan_applications = LoanApplication.all
  end


  private

  #
  # Redirect to root_url when RecordNotFound
  #
  def catch_not_found
    yield
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, flash: { error: "Record not found." }
  end

  def loan_application_params
    params.require(:loan_application).permit(:requested_principle, :requested_term_months)
  end

  #
  # For minimal implelmentation, only accept some basic fields for 'Business' model
  #
  def business_params
    params.require(:loan_application).require(:business).permit(
      :legal_name, :founded_date, :num_employees, :business_url,
      :estimated_annual_revenue, :organization_type)
  end

  #
  # For minimal implelmentation, only accept some basic fields for 'BusinessOwner' model
  #
  def owner_params
    params.require(:loan_application).require(:business_owner).permit(
      :last_name, :first_name, :email, :phone_number, :percentage_ownership, :birthdate)
  end
end
