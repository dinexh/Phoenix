defmodule CounterAppWeb.Router do
  use CounterAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CounterAppWeb do
    pipe_through :api

    get "/count", CounterController, :get
    post "/inc", CounterController, :increment
    post "/dec", CounterController, :decrement
    post "/reset", CounterController, :reset
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:counter_app, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
