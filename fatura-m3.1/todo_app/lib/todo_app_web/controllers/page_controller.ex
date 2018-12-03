defmodule TodoAppWeb.PageController do
  use TodoAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
