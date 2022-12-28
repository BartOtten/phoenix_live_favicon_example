defmodule PhoenixLiveViewFaviconWeb.ResetFav do
  import Phoenix.Component, only: [assign: 2]

  def on_mount(:default, _params, _session, socket) do
    socket =
      socket
      |> Phx.Live.Favicon.reset()
      |> assign(page_title: "OnMount pagetitle")

    {:cont, socket}
  end
end

defmodule PhoenixLiveViewFaviconWeb.Router do
  use PhoenixLiveViewFaviconWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PhoenixLiveViewFaviconWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  live_session :default, on_mount: PhoenixLiveViewFaviconWeb.ResetFav do
    scope "/", PhoenixLiveViewFaviconWeb do
      pipe_through :browser

      live "/", FaviconLive, :index
      live "/other", OtherLive, :index
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixLiveViewFaviconWeb do
  #   pipe_through :api
  # end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
