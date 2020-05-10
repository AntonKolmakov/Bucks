class SyncChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sync_channel"
  end
end