# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphqlFitnessTracker.Repo.insert!(%GraphqlFitnessTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GraphqlFitnessTracker.Identity

users = [
  %{
    name: "Tom Reis",
    email: "tom@localhost.com",
    password: "abc123"
  },
  %{
    name: "Alaina Reis",
    email: "alaina@localhost.com",
    password: "abc123"
  }
]

Enum.map(users, fn params ->
  {:ok, user} = params |> Identity.create_user()
  user
end)