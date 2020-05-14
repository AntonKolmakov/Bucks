class DashboardController < ApplicationController
  frondit UserPolicy

  def index
    @data =
      if $redis.get("currency-data").nil?
        SyncCurrencyWorker.perform_async
        { status: 'in_progress' }.to_json
      else
        $redis.get("currency-data")
      end
  end
end