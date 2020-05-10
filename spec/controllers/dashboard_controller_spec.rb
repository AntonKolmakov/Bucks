require 'rails_helper'

describe DashboardController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    allow(CurrencyApiClient::Fetcher).to receive(:call).and_return('fooBar')
  end

  describe '#index' do
    it 'Sends data broadcast to websocket' do
      perform_enqueued_jobs do
        expect { get :index }.to have_broadcasted_to('sync_channel')
                             .with(data: 'fooBar', status: 'finished')
      end
    end

    it 'responds with 200' do
      expect(response.code).to eq('200')
    end
  end
end