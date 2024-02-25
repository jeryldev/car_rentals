defmodule CarRentalsWeb.API.CategoryControllerTest do
  use CarRentalsWeb.ConnCase

  describe "GET /api/categories" do
    test "returns a list of categories", %{conn: conn} do
      conn = get(conn, "/api/categories")

      assert json_response(conn, 200)["data"] == [
               %{
                 "description" => "Small and fuel-efficient",
                 "id" => "1234567890",
                 "name" => "Compact"
               }
             ]
    end
  end
end
