defmodule LiveviewTraining.Repo do
  use Ecto.Repo,
    otp_app: :liveview_training,
    adapter: Ecto.Adapters.Postgres
end
