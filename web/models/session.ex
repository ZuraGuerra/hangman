defmodule Hangman.Session do
  use Hangman.Web, :model

  schema "sessions" do
    field :total_word_count, :integer
    field :correct_word_count, :integer
    field :is_submited, :boolean, default: false
    belongs_to :player, Hangman.Player
    belongs_to :current_word, Hangman.Word

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:total_word_count, :correct_word_count, :is_submited])
    |> validate_required([:total_word_count, :correct_word_count, :is_submited])
  end
end
