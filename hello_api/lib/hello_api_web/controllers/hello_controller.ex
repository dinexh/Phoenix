defmodule HelloApiWeb.HelloController do
  use HelloApiWeb, :controller
  def hello(conn, _parms) do
     json(conn, %{message: "Hello from Phoenix API!"})
  end
end
