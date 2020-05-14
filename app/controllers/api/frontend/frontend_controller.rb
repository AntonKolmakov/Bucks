module Api
  module Frontend
    class FrontendController < ApplicationController
      after_action :verify_authorized

      private

      def render_response
        content = yield
        status = :ok
      rescue ActiveRecord::RecordInvalid => e
        status = :unprocessable_entity
        content = e.record.errors
      rescue StandardError => e
        status = :bad_request
        content = e.message
      ensure
        render json: content, status: status
      end
    end
  end
end
