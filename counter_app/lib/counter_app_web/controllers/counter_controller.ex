defmodule CounterAppWeb.CounterController do
  use CounterAppWeb, :controller

  alias CounterApp.Counter

  def get(conn, _params) do
    count = Counter.get()
    json(conn, %{count: count})
  end

  def increment(conn, _params) do
    Counter.inc()
    json(conn, %{status: "incremented"})
  end

  def decrement(conn, _params) do
    Counter.dec()
    json(conn, %{status: "decremented"})
  end

  def reset(conn, _params) do
    Counter.reset()
    json(conn, %{status: "reset"})
  end
end
