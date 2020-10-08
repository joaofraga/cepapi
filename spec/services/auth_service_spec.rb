require "rails_helper"

describe "AuthService" do
  let(:payload) {{ "user" => { "id" => 1 } }}

  context "#issue" do
    subject { AuthService.issue(payload) }

    it "encodes a given payload and returns a token" do
      expect(subject).to be_present
      expect(subject).to be_an_instance_of String
    end
  end

  context "#decode" do
    let(:token) { AuthService.issue(payload) }
    subject { AuthService.decode(token) }

    it "decodes a token and retrieve a payload" do
      expect(subject).to eq(payload)
    end
  end

  context "#auth_secret" do
    subject { AuthService.auth_secret }
    it "returns a value to be used as secret" do
      expect(subject).to eq(ENV["AUTH_SECRET"])
    end
  end
end