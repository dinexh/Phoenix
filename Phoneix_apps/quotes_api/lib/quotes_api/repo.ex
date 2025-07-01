defmodule QuotesApi.Repo do
  use Ecto.Repo,
    otp_app: :quotes_api,
    adapter: Ecto.Adapters.Postgres
end
