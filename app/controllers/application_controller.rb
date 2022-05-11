class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def get_response(message, data = nil)
    data ? { message:, data: } : { message: }
  end

  private

  def record_not_found(error)
    render status: :not_found, json: { message: error.message }
  end
end
