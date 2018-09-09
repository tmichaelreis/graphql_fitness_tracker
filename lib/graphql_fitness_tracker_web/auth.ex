defmodule GraphqlFitnessTrackerWeb.Auth do
  @moduledoc """
    Authentication and Authorization methods
  """

  @user_salt "user salt"

  def sign(data) do
    Phoenix.Token.sign(GraphqlFitnessTrackerWeb.Endpoint, @user_salt, data)
  end
end
