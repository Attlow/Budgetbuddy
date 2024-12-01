defmodule Budgetbuddy.PostsTest do
  use Budgetbuddy.DataCase

  alias Budgetbuddy.Posts

  describe "receitas" do
    alias Budgetbuddy.Posts.Receitas

    import Budgetbuddy.PostsFixtures

    @invalid_attrs %{name: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receitas = receitas_fixture()
      assert Posts.list_receitas() == [receitas]
    end

    test "get_receitas!/1 returns the receitas with given id" do
      receitas = receitas_fixture()
      assert Posts.get_receitas!(receitas.id) == receitas
    end

    test "create_receitas/1 with valid data creates a receitas" do
      valid_attrs = %{name: "some name", valor: "120.5"}

      assert {:ok, %Receitas{} = receitas} = Posts.create_receitas(valid_attrs)
      assert receitas.name == "some name"
      assert receitas.valor == Decimal.new("120.5")
    end

    test "create_receitas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_receitas(@invalid_attrs)
    end

    test "update_receitas/2 with valid data updates the receitas" do
      receitas = receitas_fixture()
      update_attrs = %{name: "some updated name", valor: "456.7"}

      assert {:ok, %Receitas{} = receitas} = Posts.update_receitas(receitas, update_attrs)
      assert receitas.name == "some updated name"
      assert receitas.valor == Decimal.new("456.7")
    end

    test "update_receitas/2 with invalid data returns error changeset" do
      receitas = receitas_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_receitas(receitas, @invalid_attrs)
      assert receitas == Posts.get_receitas!(receitas.id)
    end

    test "delete_receitas/1 deletes the receitas" do
      receitas = receitas_fixture()
      assert {:ok, %Receitas{}} = Posts.delete_receitas(receitas)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_receitas!(receitas.id) end
    end

    test "change_receitas/1 returns a receitas changeset" do
      receitas = receitas_fixture()
      assert %Ecto.Changeset{} = Posts.change_receitas(receitas)
    end
  end
end