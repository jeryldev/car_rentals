defmodule CarRentalsWeb.API.CategoryController do
  use CarRentalsWeb, :controller

  def index(conn, _params) do
    # render(conn, "index.json", [])
    json(conn, %{
      data: [%{id: "1234567890", name: "Compact", description: "Small and fuel-efficient"}]
    })
  end
end
