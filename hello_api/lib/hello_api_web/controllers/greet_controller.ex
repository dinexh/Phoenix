defmodule HelloApiWeb.GreetController do
  use HelloApiWeb, :controller
  def greet(conn, %{"name" => name}) do
  json(conn, %{message: "Hello, #{name}!"})
  end
end
