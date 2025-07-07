defmodule CounterApp.Repo.Migrations.CreateCounters do
  use Ecto.Migration

  def change do
    create table(:counters) do
      add :value, :integer, default: 0
      timestamps()
    end
  end
end
