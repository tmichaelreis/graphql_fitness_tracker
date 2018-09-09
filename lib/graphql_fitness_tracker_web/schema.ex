defmodule GraphqlFitnessTrackerWeb.Schema do
  @moduledoc """
    Define Absinthe Schema for GraphQL structure.
  """

  use Absinthe.Schema

  @doc """
    Import types from other modules to avoid cluttering this file
  """
  import_types GraphqlFitnessTrackerWeb.Schema.IdentityTypes

  @doc """
    Base query schema
  """
  query do
    @doc """
      Basic health check to see if app is running
    """
    field :health, :string do
      resolve(fn _, _, _ ->
        {:ok, "up"}
      end)
    end
  end

  @doc """
    Base mutation schema
  """
  mutation do
    import_fields :identity_mutations
  end

end
