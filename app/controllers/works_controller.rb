class WorksController < ApplicationController

  def index
    @works = Work.all
    render status: 200, json: get_response('Ok', @works)
  end

  def show
    @work = Work.find(params[:company_id])
    render status: 200, json: get_response('Ok', @work)
  end

  def create
    p params
    @work = Work.new(title: params[:title], desc: params[:desc], company_id: params[:company_id])
    if !@work.save
      render status: 400, json: get_response(@work.errors.details)
    else
      render status: 200, json: get_response('Work created successfully', @work)
    end
  end

  def update
    @work = Work.find(params[:id])
    @work.assign_attributes(work_params)
    if !@work.save
      render status: 400, json: get_response(@work.errors.details)
    else
      render status: 200, json: get_response('Work modified successfully', @work)
    end
  end

  def destroy
    @work = Work.find(params[:id])
    if !@work.destroy
      render status: 400, json: get_response(@work.errors.details)
    else
      render status: 200, json: get_response('Work deleted successfully', @work)
    end
  end

end
