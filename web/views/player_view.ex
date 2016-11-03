defmodule Hangman.PlayerView do
  use Hangman.Web, :view

  def render("index.json", %{players: players}) do
    %{data: render_many(players, Hangman.PlayerView, "player.json")}
  end

  def render("show.json", %{player: player}) do
    %{data: render_one(player, Hangman.PlayerView, "player.json")}
  end

  def render("player.json", %{player: player}) do
    %{id: player.id,
      email: player.email}
  end
end
