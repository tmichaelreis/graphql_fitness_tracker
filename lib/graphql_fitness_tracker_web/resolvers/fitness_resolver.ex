defmodule GraphqlFitnessTrackerWeb.Resolvers.FitnessResolver do
  ### Queries

  alias GraphqlFitnessTracker.Fitness

  def get_activities(_, _, _) do
    activities = Fitness.list_activities()
    {:ok, activities}
  end

  def get_workouts(_, _, %{context: %{current_user: current_user}}) do
    workouts = Fitness.list_workouts(current_user)
    {:ok, workouts}
  end

  def get_workouts(_, _, _) do
    {:ok, nil}
  end

  def get_activity(workout, _, _) do
    activity = Fitness.get_activity(workout)
    {:ok, activity}
  end
end
