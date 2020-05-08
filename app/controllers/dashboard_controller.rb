class DashboardController < ApplicationController
  def index
    # Rails.cache.fetch([I18n.locale, params[:from], params[:to]], expires_in: 1.hour) do
    # @data = CurrencyApiClient::Fetcher.call
    @data = {"USD_RUB":73.490501}.to_json
    # end
  end
end