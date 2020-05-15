class SyncCurrencyWorker
  include Sidekiq::Worker

  def perform
    data = CurrencyApiClient::Fetcher.call
    return fetch_currency(data) if data.respond_to?(:parsed_response)
  end

  private

  def fetch_currency(data)
    result = data.parsed_response['USD_RUB']

    $redis.setex("currency-data", 1800, result)

    sleep 3
    ActionCable.server.broadcast("sync_channel", data: result, status: 'finished')
  end
end