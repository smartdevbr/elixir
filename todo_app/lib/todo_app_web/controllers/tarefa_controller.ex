defmodule TodoAppWeb.TarefaController do
  use TodoAppWeb, :controller
  import Ecto.Repo
  alias TodoApp.{Tarefa, Repo}

  def new(conn, _params) do
    changeset = Tarefa.changeset(%Tarefa{})
    render conn, "new.html", changeset: changeset, soma: 3+3
  end

  def create(conn, %{"tarefa" => tarefa}) do
    changeset = Tarefa.changeset(%Tarefa{}, tarefa)
    case Repo.insert changeset do
      {:ok, struct} -> IO.inspect struct
      {:error, changeset} -> IO.inspect changeset
    end
    render conn, "tarefas.html", tarefa: tarefa
  end

end
