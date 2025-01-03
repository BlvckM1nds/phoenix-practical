defmodule PhoenixpracticeWeb.HelloController do
  use PhoenixpracticeWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix!")
    |> render(:index)

    # render(conn, :index)
    # text(conn, "This is text example")
    # json(conn, %{
    #   msg: "message",
    #   sender: "Ryu Alvano"
    # })
    # redirect(conn, to: ~p"/hello/hai")
    # redirect(conn, external: "https://docs.google.com/spreadsheets/d/1bWClj5LEiHSkgFpBwRTBRK4erNnuaf2jZkpnOHVlXbc/edit?gid=0#gid=0")
    # send_resp(conn, 201, "This is success")
  end

  def show(conn, %{"msg" => msg}) do
    # render(conn, :show, msg: msg)
    conn
    |> assign(:msg, msg)
    |> render(:show)
  end
end
