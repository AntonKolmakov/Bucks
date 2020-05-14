require 'rails_helper'

describe Api::Frontend::ExchangeRatesController, type: :controller do
  let(:admin) { create(:user, :admin) }
  let(:valid_params) do
    Hash(exchange_rate: {rate: '73.56783', expired_at: Time.current + 1.minute })
  end

  let(:invalid_params) do
    Hash(exchange_rate: {rate: '', expired_at: Time.current + 1.minute })
  end

  before do
    sign_in(admin)
    allow($redis).to receive(:setex).and_return(nil)
  end

  describe '#create' do
    context 'with valid params' do
      it 'responds with 200' do
        post :create, params: valid_params
        expect(response.code).to eq('200')
      end
    end

    context 'with invalid params' do
      before { post :create, params: invalid_params }
      it 'responds with 422' do
        expect(response.code).to eq('422')
      end

      it 'returns json error array' do
        expect(JSON.parse(response.body)['rate'][0]).to eq("can't be blank")
      end
    end
  end
end