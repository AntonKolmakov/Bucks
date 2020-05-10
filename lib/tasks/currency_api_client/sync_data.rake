namespace :currency_api_client do
  task sync_data: :environment do
    CurrencyApiClient::Fetcher.call
  end
end
