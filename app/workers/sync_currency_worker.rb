class SyncCurrencyWorker
  include Sidekiq::Worker

  def perform
    data = CurrencyApiClient::Fetcher.call.parsed_response['USD_RUB']
    $redis.setex("currency-data", 1800, data)
    sleep 3

    update_page(data)
  end

  private

  def update_page(data)
    ActionCable.server.broadcast("sync_channel", data: data, status: 'finished')
  end
end