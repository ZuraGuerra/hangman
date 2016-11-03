defmodule Hangman.WordView do
  use Hangman.Web, :view

  def render("index.json", %{words: words}) do
    %{data: render_many(words, Hangman.WordView, "word.json")}
  end

  def render("show.json", %{word: word}) do
    %{data: render_one(word, Hangman.WordView, "word.json")}
  end

  def render("word.json", %{word: word}) do
    %{id: word.id,
      content: word.content}
  end
end
