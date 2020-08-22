defmodule LiveViewStudio.FlightsTest do
  use LiveViewStudio.DataCase

  alias LiveViewStudio.Flights

  describe "flights" do
    alias LiveViewStudio.Flights.Flight

    @valid_attrs %{arrival_time: "2010-04-17T14:00:00.000000Z", departure_time: "2010-04-17T14:00:00.000000Z", destination: "some destination", number: "some number", origin: "some origin"}
    @update_attrs %{arrival_time: "2011-05-18T15:01:01.000000Z", departure_time: "2011-05-18T15:01:01.000000Z", destination: "some updated destination", number: "some updated number", origin: "some updated origin"}
    @invalid_attrs %{arrival_time: nil, departure_time: nil, destination: nil, number: nil, origin: nil}

    def flight_fixture(attrs \\ %{}) do
      {:ok, flight} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Flights.create_flight()

      flight
    end

    test "list_flights/0 returns all flights" do
      flight = flight_fixture()
      assert Flights.list_flights() == [flight]
    end

    test "get_flight!/1 returns the flight with given id" do
      flight = flight_fixture()
      assert Flights.get_flight!(flight.id) == flight
    end

    test "create_flight/1 with valid data creates a flight" do
      assert {:ok, %Flight{} = flight} = Flights.create_flight(@valid_attrs)
      assert flight.arrival_time == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
      assert flight.departure_time == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
      assert flight.destination == "some destination"
      assert flight.number == "some number"
      assert flight.origin == "some origin"
    end

    test "create_flight/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Flights.create_flight(@invalid_attrs)
    end

    test "update_flight/2 with valid data updates the flight" do
      flight = flight_fixture()
      assert {:ok, %Flight{} = flight} = Flights.update_flight(flight, @update_attrs)
      assert flight.arrival_time == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
      assert flight.departure_time == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
      assert flight.destination == "some updated destination"
      assert flight.number == "some updated number"
      assert flight.origin == "some updated origin"
    end

    test "update_flight/2 with invalid data returns error changeset" do
      flight = flight_fixture()
      assert {:error, %Ecto.Changeset{}} = Flights.update_flight(flight, @invalid_attrs)
      assert flight == Flights.get_flight!(flight.id)
    end

    test "delete_flight/1 deletes the flight" do
      flight = flight_fixture()
      assert {:ok, %Flight{}} = Flights.delete_flight(flight)
      assert_raise Ecto.NoResultsError, fn -> Flights.get_flight!(flight.id) end
    end

    test "change_flight/1 returns a flight changeset" do
      flight = flight_fixture()
      assert %Ecto.Changeset{} = Flights.change_flight(flight)
    end
  end
end
