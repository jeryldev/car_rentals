defmodule CarRentals.Repo do
  use Ecto.Repo,
    otp_app: :car_rentals,
    adapter: Ecto.Adapters.Postgres
end
