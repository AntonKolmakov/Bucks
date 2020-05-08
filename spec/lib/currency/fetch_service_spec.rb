require 'rails_helper'

describe CurrencyApiClient::Fetcher do
  let(:token) { Rails.application.credentials.currency_api_key }
  let(:request_uri) { "https://free.currconv.com/api/v7/convert?compact=ultra&q=USD_RUB&apiKey=#{token}" }
  subject { described_class.call }

  describe 'Valid' do
    before do
      stub_request(:get, request_uri).to_return(status: 200, body: response, headers: {})
    end

    let(:response) { {"USD_RUB":73.490501}.to_json }

    it 'Returns exchanges currency' do
      expect(subject.response.body).to eq(response)
    end
  end

  describe 'Invalid response' do
    before do
      stub_request(:get, "https://free.currconv.com/api/v7/convert?compact=ultra&q=USD_RUB&apiKey=#{Rails.application.credentials.currency_api_key}").to_return(status: 400, body: response, headers: {})
    end

    let(:response) { {"status":400, "error":"API Key is required."}.to_json }

    it { expect(subject).to eq( error: "API Key is required." ) }
  end
end