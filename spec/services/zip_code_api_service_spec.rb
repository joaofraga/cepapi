require "rails_helper"

describe 'ZipCodeApiService' do
  subject { ZipCodeApiService.new(code) }

  context '.find' do
    context 'when code is valid' do
      let(:code) { "31340400" }

      it 'retrieve zip code information from API' do
        expect( subject.find ).to be_an_instance_of(Hash)
      end

      it 'format the response into application format' do
        subject_cache = subject.find

        expect( subject_cache[:address] ).not_to be_nil
        expect( subject_cache[:city] ).not_to be_nil
        expect( subject_cache[:district] ).not_to be_nil
        expect( subject_cache[:state] ).not_to be_nil
        expect( subject_cache[:code] ).to eq(code)
      end
    end

    context 'when code is not valid' do
      let(:code) { "30340400" }

      it 'raises NotFoundError' do
        expect { subject.find }.to raise_error(ApiExceptions::InvalidRequest)
      end
    end
  end
end