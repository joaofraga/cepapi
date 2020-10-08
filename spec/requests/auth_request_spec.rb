require 'rails_helper'

RSpec.describe "AuthController", type: :request do
  context "POST /authenticate" do
    before(:each) do
      post '/authenticate', params: params, headers: headers
    end
    let(:params) {{ }}
    let(:headers) {{ }}

    context "with valid user" do
      let(:password) { '12345678' }
      let(:user) { create(:user, { password: password }) }
      let(:params) {{ email: user.email, password: password }}

      it { expect(response).to have_http_status(200) }

      it "should return a token" do
        token_response = JSON.parse(response.body)

        expect(token_response["token"]).to eq(AuthService.issue({ user_id: user.id }))
      end
    end

    context "with invalid user" do
      let(:params) {{ email: 'noemail', password: 'nopass' }}

      it { expect(response).to have_http_status(404) }

      it "should display an error message" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["message"]).to eq("Invalid user or password!")
      end
    end
  end
end
