defmodule LiveGtnWeb.PageLive do
  use LiveGtnWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, number:  :rand.uniform(9999))}
  end

  @impl true
  def handle_event("guess", %{"ans" => query}, socket) do
    {:noreply, assign(socket, results: 0, query: query)}
  end

end
