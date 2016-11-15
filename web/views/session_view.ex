defmodule Hangman.SessionView do
  use Hangman.Web, :view

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, Hangman.SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, Hangman.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{id: session.id,
      player_id: session.player_id,
      total_word_count: session.total_word_count,
      current_word_id: session.current_word_id,
      correct_word_count: session.correct_word_count,
      is_submited: session.is_submited}
  end
end
