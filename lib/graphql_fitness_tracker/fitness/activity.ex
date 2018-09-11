defmodule GraphqlFitnessTracker.Fitness.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
