require 'rails_helper'

describe ExchangeRate, type: :model do
  let(:force_rate) { create(:exchange_rate, expired_at: Time.current + 1.minute) }

  before do
    allow($redis).to receive(:setex).and_return(nil)
  end

  it 'Sends data broadcast to websocket' do
    force_rate
    expect {
      ActionCable.server.broadcast(
        "sync_channel", data: force_rate.rate, status: 'finished'
      )
    }.to have_broadcasted_to("sync_channel")
  end
end