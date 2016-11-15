defmodule Hangman.SessionControllerTest do
  use Hangman.ConnCase

  alias Hangman.Session
  @valid_attrs %{correct_word_count: 42, is_submited: true, total_word_count: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, session_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    session = Repo.insert! %Session{}
    conn = get conn, session_path(conn, :show, session)
    assert json_response(conn, 200)["data"] == %{"id" => session.id,
      "player_id" => session.player_id,
      "total_word_count" => session.total_word_count,
      "current_word_id" => session.current_word_id,
      "correct_word_count" => session.correct_word_count,
      "is_submited" => session.is_submited}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, session_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), session: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Session, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), session: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    session = Repo.insert! %Session{}
    conn = put conn, session_path(conn, :update, session), session: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Session, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    session = Repo.insert! %Session{}
    conn = put conn, session_path(conn, :update, session), session: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    session = Repo.insert! %Session{}
    conn = delete conn, session_path(conn, :delete, session)
    assert response(conn, 204)
    refute Repo.get(Session, session.id)
  end
end
