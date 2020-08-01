defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view

  import LiveViewStudio.Licences, only: [calculate: 1]
  import Inflex, only: [inflect: 2]
  import Number.Currency, only: [number_to_currency: 2]

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    expiration_time = Timex.shift(Timex.now(), hours: 1)

    socket = assign(socket,
      seats: 2,
      amount: calculate(2),
      expiration_time: expiration_time,
      time_remaining: time_remaining(expiration_time)
      )
    {:ok, socket}
  end

  defp time_remaining(expiration_time) do
    Timex.Interval.new(from: Timex.now(), until: expiration_time)
    |> Timex.Interval.duration(:seconds)
    |> Timex.Duration.from_seconds()
    |> Timex.format_duration(:humanized)
  end

  def handle_info(:tick, socket) do
    expiration_time = socket.assigns.expiration_time
    socket = assign(socket, time_remaining: time_remaining(expiration_time))
    {:noreply, socket}
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
        <p class="m-4 font-semibold text-indigo-800">
          <%= @time_remaining %> left to save 20%
        </p>
          <div class="seats">
            <img src="images/license.svg">
            <span>
              Your license is currently for
              <strong><%= @seats %></strong> <%= inflect("seat", @seats) %>.
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
