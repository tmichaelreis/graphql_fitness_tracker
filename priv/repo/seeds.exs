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

alias GraphqlFitnessTracker.{Identity, Fitness}

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

[user1, user2] = Enum.map(users, fn params ->
  {:ok, user} = params |> Identity.create_user()
  user
end)

activities =[
  %{
    name: "Cycling"
  },
  %{
    name: "Climbing"
  },
  %{
    name: "Running"
  },
  %{
    name: "Yoga"
  }
]

[cycling, climbing, running, yoga] = Enum.map(activities, fn params ->
  {:ok, activity} = params |> Fitness.create_activity()
  activity
end)

workouts = [
  %{
    duration: 3600,
    location: "Copper Mountain",
    activity_id: cycling.id,
    user_id: user1.id
  },
  %{
    duration: 60 * 90,
    location: "Golden",
    activity_id: running.id,
    user_id: user1.id
  },
  %{
    duration: 3600,
    location: "The Ranch",
    activity_id: yoga.id,
    user_id: user1.id
  },
  %{
    duration: 3600,
    location: "Rockn and Jamn",
    activity_id: climbing.id,
    user_id: user2.id
  }
]

Enum.map(workouts, fn params ->
  {:ok, workout} = params |> Fitness.create_workout()
end)