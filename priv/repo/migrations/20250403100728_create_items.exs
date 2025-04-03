defmodule CrudApi.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
