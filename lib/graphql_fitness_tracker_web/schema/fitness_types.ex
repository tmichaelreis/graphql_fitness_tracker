defmodule GraphqlFitnessTrackerWeb.Schema.FitnessTypes do
  use Absinthe.Schema.Notation

  alias GraphqlFitnessTracker.Fitness

  alias GraphqlFitnessTrackerWeb.Resolvers

  object :fitness_queries do
    field :activities, non_null(list_of(:activity)) do
      resolve(&Resolvers.FitnessResolver.get_activities/3)
    end

    field :workouts, list_of(:workout) do
      resolve(&Resolvers.FitnessResolver.get_workouts/3)
    end
  end

  object :activity do
    field(:name, :string)
  end

  object :workout do
    field(:duration, :integer)
    field(:location, :string)

    field :activity, :activity do
      resolve(&Resolvers.FitnessResolver.get_activity/3)
    end
  end
end
