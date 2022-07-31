defmodule PhoenixLiveViewFaviconWeb.PageController do
  use PhoenixLiveViewFaviconWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
