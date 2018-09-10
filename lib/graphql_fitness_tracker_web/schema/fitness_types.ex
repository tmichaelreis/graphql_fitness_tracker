defmodule GraphqlFitnessTrackerWeb.Schema.FitnessTypes do
  use Absinthe.Schema.Notation

  alias GraphqlFitnessTracker.Fitness

  alias GraphqlFitnessTrackerWeb.Resolvers

  object :fitness_queries do
    field :activities, non_null(list_of(:activity)) do
      resolve &Resolvers.FitnessResolver.get_activities/3
    end
  end

  object :activity do
    field :name, :string
  end

end
