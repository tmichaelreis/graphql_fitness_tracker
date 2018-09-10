defmodule GraphqlFitnessTrackerWeb.Schema.IdentityTypes do
  @moduledoc """
    Absinthe Query type definitions for modules
    in the Identity context
  """

  # Allow the use of Absinthe schema macros like
  # `object` and `field`
  use Absinthe.Schema.Notation

  alias GraphqlFitnessTracker.Identity

  object :identity_queries do
    field :me, :user do
      resolve fn _, _, %{context: context} ->
        {:ok, context[:current_user]}
      end
    end
  end

  object :identity_mutations do
    field :create_session, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &create_session/3
    end
  end

  # Create user session
  def create_session(_, %{email: email, password: password}, _) do
    case Identity.authenticate(email, password) do
      {:ok, user} ->
        session = %{
          user: user,
          token: GraphqlFitnessTrackerWeb.Auth.sign(user.id)
        }

        {:ok, session}

      error ->
        error
    end
  end

  object :session do
    field :user, non_null(:user)
    field :token, non_null(:string)
  end

  object :user do
    field :name, :string
    field :email, :string
  end
end
