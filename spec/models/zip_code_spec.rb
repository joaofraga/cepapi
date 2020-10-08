require 'rails_helper'

RSpec.describe ZipCode, type: :model do
  subject { build(:zip_code) }

  context ".full_address" do
    it "should display the full address" do
      expect(subject.full_address).to include(subject.address)
      expect(subject.full_address).to include(subject.city)
      expect(subject.full_address).to include(subject.district)
      expect(subject.full_address).to include(subject.state)
      expect(subject.full_address).to include(subject.code)
    end
  end

  context ".to_json" do
    it "should display full address when serializing" do
      expect(subject.to_json[:full_address]).to eq(subject.full_address)
    end
    it "should not display internal id" do
      expect(subject.to_json).to_not have_key(:id)
    end
  end
end
