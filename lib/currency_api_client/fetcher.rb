module CurrencyApiClient
  class Fetcher < DryService
    REQUEST_URI = "https://free.currconv.com/api/v7/convert?q=USD_RUB&compact=ultra&apiKey="

    def call
      raise(CurrencyApiClient::Error, JSON.parse(response.body)['error']) unless response.ok?

      # JSON.parse(response.body)
      response
    rescue CurrencyApiClient::Error => e
      { error: e.message }
    end

    private

    def api_url
      REQUEST_URI + token
    end

    def token
      Rails.application.credentials.currency_api_key
    end

    def response
      @_response ||= HTTParty.get(api_url)
    end
  end
end
