defmodule LiveGtnWeb.PageLive do
  use LiveGtnWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, number:  Enum.random(1000..9999))}
  end

  @impl true
  def handle_event("guess", %{"ans" => ans}, socket) do
    {:noreply, assign(socket, results: 0, ans: ans)}
  end

  @impl true
  def handle_event("reset", %{"value" => ""}, socket) do
    {:noreply, assign(socket, score: 13, number: Enum.random(1000..9999))}
  end

end
