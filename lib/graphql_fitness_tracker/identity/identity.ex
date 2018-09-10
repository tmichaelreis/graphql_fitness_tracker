defmodule GraphqlFitnessTracker.Identity do
  @moduledoc """
    The Identity context
  """

  alias GraphqlFitnessTracker.Identity.User
  alias GraphqlFitnessTracker.Repo

  alias Comeonin.Ecto.Password

  def authenticate(email, password) do
    user = Repo.get_by(User, email: email)

    if user && Password.valid?(password, user.password) do
      {:ok, user}
    else
      {:error, "unauthorized"}
    end
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user(user_id) do
    Repo.get(User, user_id)
  end
end
