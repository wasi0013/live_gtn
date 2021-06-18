defmodule LiveGtnWeb.PageLive do
  use LiveGtnWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,
        score: 100,
        number:  "????",
        answer: "#{Enum.random(1000..9999)}",
        message: "Make a Guess!"
        )}
  end

  @impl true
  def handle_event("guess", %{"number" => number}, socket) when number == socket.assigns.answer do
    {:noreply, assign(socket,
         number: number,
         message: "You Won!"
         )}
  end

  @impl true
  def handle_event("guess", %{"number" => number}, socket) do
    score = socket.assigns.score - 1
    if (Integer.parse(socket.assigns.answer) < Integer.parse(number)) do
      {:noreply, assign(socket,
      message: "Your guess is too high. Try again!",
      score: score
      )}
    else
      {:noreply, assign(socket,
      message: "Your guess is too Low. Try again!",
      score: score
      )}
    end


  end

  @impl true
  def handle_event("reset", %{"value" => ""}, socket) do
    {:noreply, assign(socket,
        score: 100,
        number: "????",
        answer: "#{Enum.random(1000..9999)}",
        message: "Make a Guess!"
        )}
  end

end
