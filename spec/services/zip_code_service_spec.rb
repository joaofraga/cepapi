require "rails_helper"

describe 'ZipCodeService' do
  subject { ZipCodeService.new(code) }

  context '.find' do
    context 'when code is on database' do
      let(:zip_code) { create(:zip_code) }
      let(:code) { zip_code.code }

      it 'returns a ZipCode instance' do
        zip_code_service = subject.find
        expect(zip_code_service).to be_an_instance_of(ZipCode)
        expect(zip_code_service).to eq(zip_code)
      end
    end

    context 'when code is not on database' do
      let(:code) { '31340400' }

      it 'finds ZipCode information from API' do
        expect( subject.find ).to be_an_instance_of(ZipCode)
      end

      it 'creates a new ZipCode object' do
        expect{ subject.find }.to change{ ZipCode.count }.from(0).to(1)
      end
    end
  end
end