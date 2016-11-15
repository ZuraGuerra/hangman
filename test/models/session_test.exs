defmodule Hangman.SessionTest do
  use Hangman.ModelCase

  alias Hangman.Session

  @valid_attrs %{correct_word_count: 42, is_submited: true, total_word_count: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Session.changeset(%Session{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end
end
