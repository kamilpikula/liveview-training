defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Licences

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 2, amount: Licences.calculate(2))
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= @seats %>
    """
  end
end
