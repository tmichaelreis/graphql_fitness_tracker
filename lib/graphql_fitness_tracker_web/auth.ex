defmodule GraphqlFitnessTrackerWeb.Auth do
  @moduledoc """
    Authentication and Authorization methods
  """

  alias GraphqlFitnessTrackerWeb.Endpoint

  @user_salt "user salt"

  def sign(data) do
    Phoenix.Token.sign(Endpoint, @user_salt, data)
  end

  def verify(data) do
    Phoenix.Token.verify(Endpoint, @user_salt, data, max_age: 365 * 24 * 3600)
  end
end
