require 'rails_helper'

describe Api::Frontend::ExchangeRatesController, type: :controller do
  describe '#create' do
    let(:valid_params) do
      Hash(exchange_rate: {rate: '73.56783', expired_at: Time.current + 1.minute })
    end

    context 'Admin' do
      let(:admin) { create(:user, :admin) }

      let(:invalid_params) do
        Hash(exchange_rate: {rate: '', expired_at: Time.current + 1.minute })
      end

      before do
        sign_in(admin)
        allow($redis).to receive(:setex).and_return(nil)
      end

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

    context 'User' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        post :create, params: valid_params
      end

      it 'responds eith 302' do
        expect(response.code).to eq('302')
      end

      it "doesn't allow this action" do
        expect(response).to redirect_to(root_path)
      end

      it "doesn't save any records" do
        expect(ExchangeRate.count).to eq(0)
      end
    end
  end
end