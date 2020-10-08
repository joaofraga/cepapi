class ApplicationController < ActionController::Base
  skip_forgery_protection
  rescue_from ApiExceptions::InvalidRequest, with: :render_error_response

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user_id"])
      if user
        @current_user ||= user
      end
    end
  end

  private

  def authenticate!
    raise ApiExceptions::InvalidRequest.new(401) unless logged_in?
  end

  def render_error_response(error)
    render json: error.to_json, status: error.code
  end

  def token
    request.headers['Authorization'].scan(/Bearer (.*)$/).flatten.last
  end

  def auth
    AuthService.decode(token)
  end

  def auth_present?
    request.headers['Authorization'].present? &&
      !!request.headers['Authorization'].scan(/Bearer/).flatten.first
  end
end
