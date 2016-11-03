defmodule Hangman.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :email, :string

      timestamps()
    end
    create unique_index(:players, [:email])

  end
end
