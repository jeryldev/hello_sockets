defmodule HelloSocketsWeb.PingChannel do
  use HelloSocketsWeb, :channel

  # @impl true
  # def join("ping:lobby", payload, socket) do
  #   if authorized?(payload) do
  #     {:ok, socket}
  #   else
  #     {:error, %{reason: "unauthorized"}}
  #   end
  # end
  @impl true
  def join(_topic, _payload, socket) do
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  # wscat -c 'ws://localhost:4000/socket/websocket?vsn=2.0.0'
  # ["1","1","ping","phx_join",{}]
  # ["1","2","ping","ping",{}]
  @impl true
  def handle_in("ping", _payload, socket) do
    # {:reply, {:ok, payload}, socket}
    {:reply, {:ok, %{ping: "pong"}}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (ping:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
