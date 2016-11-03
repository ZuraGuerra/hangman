defmodule Hangman.WordTest do
  use Hangman.ModelCase

  alias Hangman.Word

  @valid_attrs %{content: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Word.changeset(%Word{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Word.changeset(%Word{}, @invalid_attrs)
    refute changeset.valid?
  end
end
