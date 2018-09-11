defmodule GraphqlFitnessTracker.Fitness do
  @moduledoc """
  The Fitness context.
  """

  import Ecto.Query, warn: false
  alias GraphqlFitnessTracker.Repo

  alias GraphqlFitnessTracker.Fitness.{Activity, Workout}

  @doc """
  Returns the list of activities.

  ## Examples

      iex> list_activities()
      [%Activity{}, ...]

  """
  def list_activities do
    Repo.all(Activity)
  end

  @doc """
  Creates a activity.

  ## Examples

      iex> create_activity(%{field: value})
      {:ok, %Activity{}}

      iex> create_activity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_activity(attrs \\ %{}) do
    %Activity{}
    |> Activity.changeset(attrs)
    |> Repo.insert()
  end

  def get_activity(workout) do
    Repo.get(Activity, workout.activity_id)
  end

  @doc """
  Creates a workout
  """
  def create_workout(attrs \\ %{}) do
    %Workout{}
    |> Workout.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Lists workouts for the current user
  """
  def list_workouts(current_user) do
    current_user
    |> query_workouts
    |> Repo.all()
  end

  def query_workouts(user) do
    Workout
    |> order_by(desc: :inserted_at)
    |> IO.inspect(label: "In query workouts pipe")
    |> scope_to_user(user)
  end

  def scope_to_user(query, %{id: user_id}) do
    from(workout in query,
      where: workout.user_id == ^user_id
    )
  end
end
