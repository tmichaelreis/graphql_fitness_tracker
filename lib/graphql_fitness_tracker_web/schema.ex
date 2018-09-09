defmodule GraphqlFitnessTrackerWeb.Schema do
  @moduledoc """
    Define Absinthe Schema for GraphQL structure.
  """

  use Absinthe.Schema

  @doc """
    Base query schema
  """

  query do
    field :health, :string do
      resolve(fn _, _, _ ->
        {:ok, "up"}
      end)
    end
  end
end
