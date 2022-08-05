defmodule HelloSocketsWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "ping", HelloSocketsWeb.PingChannel
  channel "ping:*", HelloSocketsWeb.PingChannel
  channel "wild:*", HelloSocketsWeb.PingChannel
  channel "dupe", HelloSocketsWeb.PingChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket) do
    nil
  end
end
