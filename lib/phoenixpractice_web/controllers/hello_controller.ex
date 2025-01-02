defmodule PhoenixpracticeWeb.HelloController do
  use PhoenixpracticeWeb, :controller

  def index(conn, _params) do
    # render(conn, :index)
    # text(conn, "This is text example")
    json(conn, %{
      msg: "message",
      sender: "Ryu Alvano"
    })
  end

  def show(conn, %{"msg" => msg}) do
    render(conn, :show, msg: msg)
  end
end
