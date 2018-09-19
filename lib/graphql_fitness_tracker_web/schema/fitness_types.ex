defmodule GraphqlFitnessTrackerWeb.Schema.FitnessTypes do
  use Absinthe.Schema.Notation

  alias GraphqlFitnessTracker.Fitness

  alias GraphqlFitnessTrackerWeb.Resolvers.FitnessResolver

  # Queries

  object :fitness_queries do
    field :activities, non_null(list_of(:activity)) do
      resolve(&FitnessResolver.get_activities/3)
    end

    field :workouts, list_of(:workout) do
      resolve(&FitnessResolver.get_workouts/3)
    end
  end

  object :activity do
    field(:id, :id)
    field(:name, :string)
  end

  object :workout do
    field(:duration, :integer)
    field(:location, :string)

    field :activity, :activity do
      resolve(&FitnessResolver.get_activity/3)
    end
  end

  # Mutations

  object :fitness_mutations do
    field :create_workout, :workout do
      arg :input, non_null(:create_workout_input)
      resolve(&FitnessResolver.create_workout/3)
    end
  end

  input_object :create_workout_input do
    field :duration, non_null(:integer)
    field :location, non_null(:string)
    field :activity_id, non_null(:id)
  end
end
