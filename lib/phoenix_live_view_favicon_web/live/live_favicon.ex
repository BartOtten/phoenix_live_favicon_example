defmodule PhoenixLiveViewFaviconWeb.Component do
  use Phoenix.LiveComponent

  def live_favicon(assigns) do
    {href, prefix, suffix} =
      if String.contains?(assigns.href, "@dynamic") do
        [prefix, suffix] = String.split(assigns.href, "@dynamic")
        href = "#{prefix}#{assigns[:variant] || ""}#{suffix}" |> String.replace("//", "/")

        {href, prefix, suffix}
      else
        {assigns.href, nil, nil}
      end

    assigns = %{
      type: assigns.type,
      sizes: assigns.sizes,
      href: href,
      suffix: suffix,
      prefix: prefix,
      rel: assigns.rel
    }

    ~H"""
    <link data-prefix={@prefix} data-suffix={@suffix} rel={@rel} href={@href} type={@type} sizes={@sizes} />
    """
  end
end
