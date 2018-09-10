defmodule GraphqlFitnessTrackerWeb.Resolvers.FitnessResolver do
  ### Queries

  alias GraphqlFitnessTracker.Fitness

  def get_activities(_, _, _) do
    activities = Fitness.list_activities
    {:ok, activities}
  end  
end
