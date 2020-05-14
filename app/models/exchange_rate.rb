class ExchangeRate < ApplicationRecord
  validates :expired_at, :rate, presence: true

  after_commit :write_cache!, on: :create

  private

  def fetch_seconds
    (expired_at - Time.current).to_i
  end

  def write_cache!
    return if expired_at <= Time.current

    $redis.setex("currency-data", fetch_seconds, self.rate)

    ActionCable.server.broadcast("sync_channel", data: self.rate, status: 'finished')
  end
end