defmodule Hangman.Repo.Migrations.CreateWord do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :content, :string

      timestamps()
    end

  end
end
