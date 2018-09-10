defmodule GraphqlFitnessTracker.FitnessTest do
  use GraphqlFitnessTracker.DataCase

  alias GraphqlFitnessTracker.Fitness

  describe "activities" do
    alias GraphqlFitnessTracker.Fitness.Activity

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def activity_fixture(attrs \\ %{}) do
      {:ok, activity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fitness.create_activity()

      activity
    end

    test "list_activities/0 returns all activities" do
      activity = activity_fixture()
      assert Fitness.list_activities() == [activity]
    end

    test "get_activity!/1 returns the activity with given id" do
      activity = activity_fixture()
      assert Fitness.get_activity!(activity.id) == activity
    end

    test "create_activity/1 with valid data creates a activity" do
      assert {:ok, %Activity{} = activity} = Fitness.create_activity(@valid_attrs)
      assert activity.name == "some name"
    end

    test "create_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fitness.create_activity(@invalid_attrs)
    end

    test "update_activity/2 with valid data updates the activity" do
      activity = activity_fixture()
      assert {:ok, activity} = Fitness.update_activity(activity, @update_attrs)
      assert %Activity{} = activity
      assert activity.name == "some updated name"
    end

    test "update_activity/2 with invalid data returns error changeset" do
      activity = activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Fitness.update_activity(activity, @invalid_attrs)
      assert activity == Fitness.get_activity!(activity.id)
    end

    test "delete_activity/1 deletes the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{}} = Fitness.delete_activity(activity)
      assert_raise Ecto.NoResultsError, fn -> Fitness.get_activity!(activity.id) end
    end

    test "change_activity/1 returns a activity changeset" do
      activity = activity_fixture()
      assert %Ecto.Changeset{} = Fitness.change_activity(activity)
    end
  end
end
