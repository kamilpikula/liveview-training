defmodule LiveViewStudioWeb.FilterLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Boats

  def mount(_params, _session, socket) do
    socket = assigns_default(socket)
    {:ok, socket, temporary_assigns: [boats: Boats.list_boats()]}
  end

  def handle_event("filter", %{"type" => type, "prices" => prices}, socket) do
    params = [type: type, prices: prices]
    boats = Boats.list_boats(params)
    socket = assign(socket, params ++ [boats: boats])

    {:noreply, socket}
  end

  def handle_event("clear-all", _, socket) do
    socket = assigns_default(socket)
    {:noreply, socket}
  end

  defp assigns_default(socket) do
    assign(socket,
      boats: Boats.list_boats(),
      type: "",
      prices: []
    )
  end

  defp type_options do
    [
      "All Types": "",
      Fishing: "fishing",
      Sporting: "sporting",
      Sailing: "sailing"
    ]
  end

  defp price_checkbox(assigns) do
    assigns = Enum.into(assigns, %{})

    ~L"""
    <input type="checkbox" id="<%= @price %>"
           name="prices[]" value="<%= @price %>"
          <%= if @checked, do: "checked" %> >
    <label for="<%= @price %>"><%= @price %></label>
    """
  end

  def render(assigns) do
    ~L"""
      <h1>Daily Boat Rentals</h1>
      <div id="filter">
        <form phx-change="filter">
          <div class="filters">
            <select name="type">
              <%= options_for_select(type_options(), @type) %>
            </select>
            <div class="prices">
              <input type="hidden" name="prices[]" value="">
              <%= for price <- ["$", "$$", "$$$"] do %>
                <%= price_checkbox(%{price: price, checked: price in @prices}) %>
              <% end %>
            </div>
            <a href="#" phx-click="clear-all">Clear All</a>
          </div>
        </form>

        <div class="boats" id="boats">
          <%= for boat <- @boats do %>
            <div class="card" id="<%= boat.id %>">
              <img src="<%= boat.image %>">
              <div class="content">
                <div class="model">
                  <%= boat.model %>
                </div>
                <div class="details">
                  <span class="price">
                    <%= boat.price %>
                  </span>
                  <span class="type">
                    <%= boat.type %>
                  </span>
                </div>
              </div>
            </div>
          <% end %>
        </div>
      </div>
    """
  end
end
