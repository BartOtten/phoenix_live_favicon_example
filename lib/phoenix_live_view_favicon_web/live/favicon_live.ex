defmodule PhoenixLiveViewFaviconWeb.FaviconLive do
  use PhoenixLiveViewFaviconWeb, :live_view
  alias Phx.Live.Favicon, as: Fav

  @insta "data:image/png;base64,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"
  def render(assigns) do
    ~L"""
    <button phx-click="green">Job succeeded</button>
    <button phx-click="red">Job failed</button>
    <button phx-click="new_message">New message</button>
    <button phx-click="base64">Suprise me!</button>
    <button phx-click="initial">Initial</button>
    <button phx-click="initial_attr">Reset href</button>
    <button phx-click="increase" id="counter" attrfoo="no"><%= @counter %></button>
    """
  end

  def mount(_params, _session, socket) do
    socket = socket |> assign(:counter, 1)

    {:ok, socket}
  end

  def handle_params(%{"variant" => "base64"}, _uri, socket) do
    socket = assign(socket, favicon: %{className: "base64", variant: "null", href: @insta})

    {:noreply, socket}
  end

  def handle_params(%{"variant" => variant}, uri, socket) do
    socket =
      assign(socket, favicon: %{className: "url", variant: variant})
      |> assign(page_title: "Welcome")

    {_, socket} = handle_event(variant, %{uri: uri}, socket)
    {:noreply, socket}
  end

  def handle_params(_, _, socket), do: {:noreply, socket}

  def handle_event("increase", _, socket) do
    socket = socket |> assign(counter: Enum.random(1..100))
    {:noreply, socket}
  end

  def handle_event("initial", value, socket) do
    socket =
      socket
      |> assign(page_title: "Initial")
      |> maybe_push_patch(value, "initial")

    {:noreply, socket}
  end

  def handle_event("initial_attr", value, socket) do
    socket =
      socket
      |> assign(page_title: "Initial Attribute")
      |> maybe_push_patch(value, "initial_attr")

    {:noreply, socket}
  end

  def handle_event("new_message", value, socket) do
    socket =
      socket
      # |> assign(favicon: %{variant: "new_message"})
      |> assign(page_title: "[12:04] Anna")
      |> maybe_push_patch(value, "new_message")

    {:noreply, socket}
  end

  def handle_event("green", value, socket) do
    socket =
      socket
      # |> assign(favicon: %{variant: "green"})
      |> assign(page_title: "Build #123")
      |> maybe_push_patch(value, "green")

    {:noreply, socket}
  end

  def handle_event("red", value, socket) do
    socket =
      socket
      # |> assign(favicon: %{variant: "red"})
      |> assign(page_title: "Build #123")
      |> maybe_push_patch(value, "red")

    {:noreply, socket}
  end

  def handle_event("base64", value, socket) do
    socket =
      socket
      # |> assign(favicon: %{href: @insta})
      |> assign(page_title: "Href Override")
      |> maybe_push_patch(value, "base64")

    {:noreply, socket}
  end

  def handle_event(_, _value, socket) do
    {:noreply, socket}
  end

  # def get_patch(socket, "base64" = variant) do
  #   %{
  #     href: %{set: @insta},
  #     className: %{set: "base64"}
  #   }
  # end

  # def get_patch(socket, variant) do
  #   %{
  #     href: %{patch: %{replace: socket.assigns.favicon.variant, with: variant}},
  #     className: %{set: "foo"}
  #   }
  # end

  def maybe_push_patch(socket, %{uri: uri}, "initial" = variant) do
    unless URI.parse(uri).query == "variant=#{variant}" do
      socket
      |> push_patch(replace: true, to: "/?variant=#{variant}")
      |> Fav.reset()
    else
      socket
    end
  end

  def maybe_push_patch(socket, _, "initial" = variant) do
    socket
    |> push_patch(replace: true, to: "/?variant=#{variant}")
    |> Fav.reset()
  end

  def maybe_push_patch(socket, %{uri: uri}, "initial_attr" = variant) do
    unless URI.parse(uri).query == "variant=#{variant}" do
      socket
      |> push_patch(replace: true, to: "/?variant=#{variant}")
      |> Fav.reset_attr(:href)
    else
      socket
    end
  end

  def maybe_push_patch(socket, _, "initial_attr" = variant) do
    socket
    |> push_patch(replace: true, to: "/?variant=#{variant}")
    |> Fav.reset_attr(:href)
  end

  def maybe_push_patch(socket, %{uri: uri}, "base64" = variant) do
    unless URI.parse(uri).query == "variant=#{variant}" do
      socket
      |> push_patch(replace: true, to: "/?variant=#{variant}")
      |> Fav.set_attr(:href, @insta)
      |> Fav.set_class(variant)
    else
      socket
    end
  end

  def maybe_push_patch(socket, _, "base64" = variant) do
    socket
    |> push_patch(replace: true, to: "/?variant=#{variant}")
    |> Fav.set_attr(:href, @insta)
    |> Fav.set_class(variant)
  end

  def maybe_push_patch(socket, %{uri: uri}, variant) do
    unless URI.parse(uri).query == "variant=#{variant}" do
      socket
      |> push_patch(replace: true, to: "/?variant=#{variant}")
      |> Fav.set_dynamic(:href, variant)
      |> Fav.set_class(variant)

      # |> push_event("head", Fav.get_patch(socket, variant))
      # |> push_event("head", %{query: "#counter", attrs: %{attrfoo: %{set: "12"}}})
    else
      socket
    end
  end

  def maybe_push_patch(socket, _, variant) do
    socket
    |> push_patch(replace: true, to: "/?variant=#{variant}")
    |> Fav.set_dynamic(:href, variant)
    |> Fav.set_class(variant)

    # |> push_event("head", %{query: "link[rel*='icon']", attrs: get_patch(socket, variant)})
    # |> push_event("head", %{query: "#counter", attrs: %{attrfoo: %{set: "12"}}})

    # |> push_event("head", %{
    #   query: "meta[property='og:title']",
    #   attrs: %{content: %{set: "#{variant}"}}
    # })
  end
end
