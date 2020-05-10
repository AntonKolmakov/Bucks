class SyncCurrencyJob < ApplicationJob
  queue_as :default

  def perform
    data = CurrencyApiClient::Fetcher.call
    update_page(data)
  end

  private

  def update_page(data)
    ActionCable.server.broadcast("sync_channel", data: data, status: 'finished')
  end
end
