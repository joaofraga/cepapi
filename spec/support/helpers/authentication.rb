module Helpers
  module Authentication
    def authenticate_as(user)
      token = User.find(user.id) || Factory.create(:user, id: user.id)

      AuthService.issue({ user_id: token.id })
    end

    def auth_headers(token)
      {
        'Authorization' =>  "Bearer #{token}"
      }
    end
  end
end