defmodule GraphqlFitnessTracker.Repo.Migrations.CreateFitness.Workout do
  use Ecto.Migration

  def change do
    create table(:workouts) do
      add :duration, :integer
      add :location, :string
      add :user_id, references(:users)
      add :activity_id, references(:activities)

      timestamps()
    end
  end
end
