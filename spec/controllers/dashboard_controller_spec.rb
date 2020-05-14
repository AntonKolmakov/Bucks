require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.inline!

describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    allow(CurrencyApiClient::Fetcher).to receive_message_chain(:call,:parsed_response, :[]).and_return('fooBar')
    allow($redis).to receive(:get).and_return(nil)
    allow($redis).to receive(:setex).and_return(nil)
  end

  describe '#index' do
    it 'Sends data broadcast to websocket' do
      expect { get :index }.to have_broadcasted_to('sync_channel')
                            .with(data: 'fooBar', status: 'finished')
    end

    it 'responds with 200' do
      expect(response.code).to eq('200')
    end
  end
end