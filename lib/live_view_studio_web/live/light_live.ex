defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Light

  def mount(_params, _session, socket) do
    socket = assign(socket,
      brightness: 10,
      temp: 3000)
    {:ok, socket}
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    #brightness = socket.assigns.brightness
    #socket = assign(socket, :brightness, brightness + 10)
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("random", _, socket) do
    socket = assign(socket, :brightness, Enum.random(0..100))
    {:noreply, socket}
  end

  def handle_event("update", %{"brightness" => brightness}, socket) do
    brightness = String.to_integer(brightness)
    socket = assign(socket, brightness: brightness)
    {:noreply, socket}
  end

  def handle_event("change-temp", %{"temp" => temp}, socket) do
    temp = String.to_integer(temp)
    socket = assign(socket, temp: temp)
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Front Light</h1>
    <div id="light">
      <div class="meter">
        <span style="width: <%= @brightness %>%;
                     background-color: <%= Light.temp_color(@temp)%>">
          <%= @brightness %>%
        </span>
      </div>

      <button phx-click="random">
        Random value!
      </button>

      <button phx-click="off">
        <img src="images/light-off.svg">
      </button>

      <button phx-click="down">
        <img src="images/down.svg">
      </button>

      <button phx-click="up">
        <img src="images/up.svg">
      </button>

      <button phx-click="on">
        <img src="images/light-on.svg">
      </button>

      <form phx-change="update">
        <input type="range" min="0" max="100"
              name="brightness" value="<%= @brightness %>" />
      </form>

      <form phx-change="change-temp">
        <h2>Change color of meter</h2>

        <input type="radio" id="3000" name="temp" value="3000"
          <%= if 3000 == @temp, do: "checked" %> />
        <label for="3000">3000</label>

        <input type="radio" id="4000" name="temp" value="4000"
          <%= if 4000 == @temp, do: "checked" %> />
        <label for="4000">4000</label>

        <input type="radio" id="5000" name="temp" value="5000"
          <%= if 5000 == @temp, do: "checked" %> />
        <label for="5000">5000</label>
      </form>

    </div>
    """
  end
end
