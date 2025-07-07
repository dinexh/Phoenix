defmodule CounterApp.Counter.Counter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "counters" do
    field :value, :integer, default: 0
    timestamps()
  end
  def changeset(counter, attrs) do
    counter
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
