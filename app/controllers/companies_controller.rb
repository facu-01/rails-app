class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    render status: 200, json: get_response('Ok', @companies)
  end

  def show
    @company = Company.find(params[:id])
    render status: 200, json: get_response('Ok', @company)
  end

  def create
    @company = Company.new(company_params)
    if !@company.save
      render status: 400, json: get_response(@company.errors.details)
    else
      render status: 200, json: get_response('Company created successfully', @company)
    end
  end

  def update
    @company = Company.find(params[:id])
    @company.assign_attributes(company_params)
    if !@company.save
      render status: 400, json: get_response(@company.errors.details)
    else
      render status: 200, json: get_response('Company modified', @company)
    end

  end

  def destroy
    @company = Company.find(params[:id])
    if !@company.destroy
      render status: 400, json: get_response(@company.errors.details)
    else
      render status: 200, json: get_response('Company deleted successfully')
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
