class DashboardController < ApplicationController
  def index
    SyncCurrencyJob.perform_later
  end
end