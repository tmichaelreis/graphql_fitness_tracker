defmodule GraphqlFitnessTrackerWeb.Router do
  use GraphqlFitnessTrackerWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(GraphqlFitnessTrackerWeb.Context)
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: GraphqlFitnessTrackerWeb.Schema,
      interface: :playground,
      socket: GraphqlFitnessTrackerWeb.UserSocket
    )
  end

  scope "/", GraphqlFitnessTrackerWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end
end
