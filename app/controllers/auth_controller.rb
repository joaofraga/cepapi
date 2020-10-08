class AuthController < ApplicationController
  def authenticate
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = AuthService.issue({ user_id: @user.id })

      render json: {
        token: token
      }
    else
      raise ApiExceptions::InvalidRequest.new(404, 'Invalid user or password!')
    end
  end
end
