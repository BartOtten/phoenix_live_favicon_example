defmodule PhoenixLiveViewFaviconWeb.OtherLive do
  use PhoenixLiveViewFaviconWeb, :live_view

  def render(assigns) do
    ~L"""
    <p>
      The favicons are fully reset due to `on_mount` 
      including Favicon.reset(socket)    
    </p>
    <pre>
    def on_mount(:default, _params, _session, socket) do
    socket =
      socket
      |> Phx.Live.Favicon.reset()
      |> assign(page_title: "OnMount pagetitle")

    {:cont, socket}
    end
    </pre>

    <%= live_patch("Go back", to: "/", class: "button") %>
    <hr>
    <strong>Current link elements</strong>
    <xmp id="sample"></xmp>
    """
  end
end
