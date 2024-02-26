defmodule CarRentals.Repo.Migrations.AlterCategoriesModifyDescriptionType do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      modify :description, :text
    end
  end
end
