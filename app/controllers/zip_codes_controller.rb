class ZipCodesController < ApplicationController
  before_action :authenticate!
  before_action :validate_fields

  def find
    @zip_code = ZipCodeService.new(params[:zip_code]).find

    render json: @zip_code.to_json
  end

  private

  def validate_fields
    raise ApiExceptions::InvalidRequest.new(400) unless params[:zip_code].present?
  end
end
