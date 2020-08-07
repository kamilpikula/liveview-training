defmodule LiveViewStudioWeb.FlightsLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Flights

  def mount(_params, _session, socket) do
    socket = assign(socket,
      search: "",
      flights: Flights.list_flights(),
      loading: false
    )

    {:ok, socket}
  end


  def handle_event(_, _, _) do

  end

  def render(assigns) do
    ~L"""

    """
  end
end
