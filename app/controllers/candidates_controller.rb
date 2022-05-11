class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
    render status: 200, json: get_response('Ok', @candidates)
  end

  def show
    @candidate = Candidate.find(params[:id])
    render status: 400, json: get_response('Ok', @candidate)
  end

  def create
    @candidate = Candidate.create(name: params[:name])
    if !@candidate.save
      render status: 400, json: get_response(@candidate.errors.details)
    else
      render status: 200, json: get_response('Candidate created successfully', @candidate)
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    if !@candidate.destroy
      render status: 400, json: get_response(@candidate.error.details)
    else
      render status: 200, json: get_response('Candidate deleted successfully', @candidate)
    end
  end

end
