defmodule TodoApp.Repo.Migrations.CriarTarefas do
  use Ecto.Migration

  def change do
    create table(:tarefas) do
      add :titulo, :string
      add :pronta, :boolean
    end
  end
end
