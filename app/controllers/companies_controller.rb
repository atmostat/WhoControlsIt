class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.find_or_create_by(company_params)
    @company.save
    # We're assuming one workflow for creating companies for now
    redirect_to new_control_relationship_path(child_id: @company.id, child_type: @company.class.to_s)
  end

  private
  def company_params
    params.require(:company).permit(:name, :company_number, :jurisdiction_code)
  end
end
