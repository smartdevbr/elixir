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
      {:ok, struct} ->
        conn
        |> put_flash(:info, "Tarefa incluida na sua lista: #{struct.titulo}")
        |> render("index.html", tarefa)
      {:error, changeset} -> render conn, "new.html", changeset: changeset
    end
  end

  def index(conn, params) do
    render conn, "index.html"
  end

end
