
module Api
  module Frontend
    class ExchangeRatesController < FrontendController
      before_action :authorize_action
      skip_before_action :verify_authenticity_token

      def create
        render_response { ExchangeRate.create!(rates_params) }
      end

      private

      def authorize_action
        authorize :user
      end

      def rates_params
        params.require(:exchange_rate).permit(:rate, :expired_at)
      end
    end
  end
end