defmodule LiveViewStudioWeb.FlightsLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Flights

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        number: "",
        flights: [],
        loading: false
      )

    {:ok, socket}
  end

  def handle_event("number-search", %{"number" => number}, socket) do
    send(self(), {:run_number_flight_search, number})

    socket =
      assign(socket,
        number: number,
        flights: [],
        loading: true
      )
    {:noreply, socket}
  end
  def handle_info({:run_number_flight_search, number}, socket) do
    :timer.sleep(1000)
    case Flights.search_by_number(number) do
     [] ->
          socket =
            socket
            |> put_flash(:info, "No find your flight number")
            |> assign(flights: [], loading: false)

          {:noreply, socket}
      flights ->
          socket =
            socket
            |> clear_flash()
            |> assign(flights: flights, loading: false)

          {:noreply, socket}
    end
  end

  def render(assigns) do
    ~L"""
    <h1>Find a Flight</h1>
    <div id="search">

      <form phx-submit="number-search">
        <input type="text" name="number" value="<%= @number %>" placeholder="Flight number"
        <%= if @loading, do: "readonly" %>>
        <button type="submit">
          <img src="images/search.svg">
        </button>
      </form>
      <%= if @loading do %>
        <div class="loader">Loading...</div>
      <% end %>

      <div class="flights">
        <ul>
          <%= for flight <- @flights do %>
            <li>
              <div class="first-line">
                <div class="number">
                  Flight #<%= flight.number %>
                </div>
                <div class="origin-destination">
                  <img src="images/location.svg">
                  <%= flight.origin %> to
                  <%= flight.destination %>
                </div>
              </div>
              <div class="second-line">
                <div class="departs">
                  Departs: <%= Flights.format_time(flight.departure_time) %>
                </div>
                <div class="arrives">
                  Arrives: <%= Flights.format_time(flight.arrival_time) %>
                </div>
              </div>
            </li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end
end
