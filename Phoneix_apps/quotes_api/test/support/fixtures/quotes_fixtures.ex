defmodule QuotesApi.QuotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuotesApi.Quotes` context.
  """

  @doc """
  Generate a quote.
  """
  def quote_fixture(attrs \\ %{}) do
    {:ok, quote} =
      attrs
      |> Enum.into(%{
        author: "some author",
        text: "some text"
      })
      |> QuotesApi.Quotes.create_quote()

    quote
  end
end
