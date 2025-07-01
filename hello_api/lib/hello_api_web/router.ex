defmodule HelloApiWeb.Router do
  use HelloApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HelloApiWeb do
    pipe_through :api
    get "/hello", HelloController, :hello
    post "/greet", GreetController, :greet
    get "/tasks", TaskController, :index
    post "/tasks", TaskController, :create
    delete "/tasks/:id", TaskController, :delete
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:hello_api, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
