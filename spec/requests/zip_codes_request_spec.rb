require 'rails_helper'

RSpec.describe ZipCodesController, type: :request do
  context "GET /find" do
    before(:each) do
      get '/find', params: params, headers: headers
    end
    let(:headers) {{ }}
    let(:params) {{ }}
    let(:zip_code) { create(:zip_code) }

    context "when authenticated" do
      let(:token) { authenticate_as(user) }
      let(:headers) { auth_headers(token) }
      let(:user) { create(:user) }

      context "when resource is found" do
        let(:params) {{ zip_code: zip_code.code }}

        it { expect(response).to have_http_status(200) }
        it "returns a zip code json object" do
          zip_code_response = JSON.parse(response.body)
          expect(zip_code_response['address']).to eq(zip_code.address)
          expect(zip_code_response['district']).to eq(zip_code.district)
          expect(zip_code_response['city']).to eq(zip_code.city)
          expect(zip_code_response['state']).to eq(zip_code.state)
          expect(zip_code_response['code']).to eq(zip_code.code)
          expect(zip_code_response['full_address']).to eq(zip_code.full_address)
        end
      end

      context "when resource is not found" do
        let(:params) {{ zip_code: "30340400" }}
        it { expect(response).to have_http_status(404) }
      end

      context "when no zip_code parameter is given" do
        let(:params) {{}}
        it { expect(response).to have_http_status(400) }
      end
    end

    context "when not authenticated" do
        it { expect(response).to have_http_status(401) }
    end
  end
end
