defmodule QuotesApi.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :author, :string
      add :text, :string

      timestamps(type: :utc_datetime)
    end
  end
end
