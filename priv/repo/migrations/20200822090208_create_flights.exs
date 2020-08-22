defmodule LiveViewStudio.Repo.Migrations.CreateFlights do
  use Ecto.Migration

  def change do
    create table(:flights) do
      add :number, :string
      add :origin, :string
      add :destination, :string
      add :departure_time, :utc_datetime_usec
      add :arrival_time, :utc_datetime_usec

      timestamps()
    end

  end
end
