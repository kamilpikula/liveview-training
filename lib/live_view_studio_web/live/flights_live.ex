defmodule LiveViewStudioWeb.FlightsLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.{Airports, Flights}

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        number: "",
        code: "",
        flights: [],
        matches: [],
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

  def handle_event("airport-code-search", %{"code" => code}, socket) do
    send(self(), {:run_airport_code_search, code})

    socket =
      assign(socket,
        code: code,
        flights: [],
        loading: true
      )
    {:noreply, socket}
  end

  def handle_event("suggestion-airport", %{"code" => prefix}, socket) do
    socket =
      assign(socket,
        matches: Airports.suggest(prefix),
        loading: false
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

  def handle_info({:run_airport_code_search, code}, socket) do
    :timer.sleep(1000)
    case Flights.search_by_airport(code) do
      [] ->
          socket =
            socket
            |> put_flash(:info, "No find your airport code")
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

      <form phx-submit="airport-code-search" phx-change="suggestion-airport">
        <input type="text"
               name="code"
               value="<%= @code %>"
               placeholder="Airport code"
               autocomplete="off"
               list="matches"
               phx-debounce="250"
               <%= if @loading, do: "readonly" %>>
        <button type="submit">
          <img src="images/search.svg">
        </button>
      </form>

      <datalist id="matches">
        <%= for match <- @matches do %>
          <option value="<%= match %>"><%= match %></option>
        <% end %>
      </datalist>

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
