defmodule Hangman.Repo.Migrations.CreateSession do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :total_word_count, :integer
      add :correct_word_count, :integer
      add :is_submited, :boolean, default: false, null: false
      add :player_id, references(:players, on_delete: :nothing)
      add :current_word_id, references(:words, on_delete: :nothing)

      timestamps()
    end
    create index(:sessions, [:player_id])
    create index(:sessions, [:current_word_id])

  end
end
