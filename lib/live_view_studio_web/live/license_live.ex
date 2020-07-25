defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view

  import LiveViewStudio.Licences, only: [calculate: 1]
  import Number.Currency, only: [number_to_currency: 2]

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 2, amount: calculate(2))
    {:ok, socket}
  end

  def handle_event("update", %{"seats" => seats}, socket) do
    seats = String.to_integer(seats)
    socket = assign(socket,
                    seats: seats,
                    amount: calculate(seats))
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>License</h1>
    <div id="license">
      <div class="card">
        <div class="content">
          <div class="seats">
            <img src="images/license.svg">
            <span>
              Your license is currently for
              <strong><%= @seats %></strong> seats.
            </span>
          </div>
          <form phx-change="update">
            <input type="range" min="1" max="10"
                  name="seats" value="<%= @seats %>" />
          </form>
          <div class="amount">
            <%= number_to_currency(@amount, precision: 0) %>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
