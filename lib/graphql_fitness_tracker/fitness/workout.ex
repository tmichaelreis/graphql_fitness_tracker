defmodule GraphqlFitnessTracker.Fitness.Workout do
  use Ecto.Schema
  import Ecto.Changeset

  alias GraphqlFitnessTracker.{Identity, Fitness}

  schema "workouts" do
    field :duration, :integer
    field :location, :string
    belongs_to :activity, Fitness.Activity
    belongs_to :user, Identity.User

    timestamps()
  end

  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:duration, :location, :user_id, :activity_id])
    |> validate_required([:user_id, :activity_id])
  end
end
