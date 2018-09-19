defmodule GraphqlFitnessTrackerWeb.Schema do
  @moduledoc """
    Define Absinthe Schema for GraphQL structure.
  """

  use Absinthe.Schema

  # Import types from other modules to avoid cluttering this file
  import_types(GraphqlFitnessTrackerWeb.Schema.{IdentityTypes, FitnessTypes})

  # Base query schema
  query do
    # Basic health check to see if app is running
    field :health, :string do
      resolve(fn _, _, _ ->
        {:ok, "up"}
      end)
    end

    import_fields(:identity_queries)
    import_fields(:fitness_queries)
  end

  # Base mutation schema
  mutation do
    import_fields(:identity_mutations)
    import_fields(:fitness_mutations)
  end
end
