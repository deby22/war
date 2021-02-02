defmodule Game.GameServer do
  use GenServer
  @name GameServer
  alias Game.GameManager

  def start_link, do: GenServer.start_link(__MODULE__, :ok, name: @name)
  def init(_), do: GameManager.new_game()

  # Client
  def new_bet(bet) when is_map(bet), do: GenServer.call(@name, {:new_bet, bet})
  def get_bet, do: GenServer.call(@name, :get_bet)
  def shuffle_cards, do: GenServer.call(@name, :shuffle)
  def get_shuffled_times, do: GenServer.call(@name, :get_shuffled_times)
  def grab_player_card, do: GenServer.call(@name, :grab_player_card)
  def grab_croupier_card, do: GenServer.call(@name, :grab_croupier_card)

  # Server

  def handle_info(:show_result, state) do
    {:ok, summary} = GameManager.game_summary(state)
    IO.inspect(summary)
    {:noreply, state}
  end

  defp show_result() do
    Process.send_after(self(), :show_result, 3000)
  end

  def handle_call(:grab_croupier_card, _from, state) do
    case GameManager.grab_croupier_card(state) do
      {:ok, game} ->
        show_result()
        {:reply, game.croupier_card, game}

      {:error, msg} ->
        {:reply, msg, state}
    end
  end

  def handle_call(:get_shuffled_times, _from, state) do
    {:reply, state.shuffled_times, state}
  end

  def handle_call(:grab_player_card, _from, state) do
    case GameManager.grab_player_card(state) do
      {:ok, game} ->
        {:reply, game.player_card, game}

      {:error, msg} ->
        {:reply, msg, state}
    end
  end

  def handle_call({:new_bet, bet}, _from, state) do
    case GameManager.create_bet(state, bet) do
      {:ok, game} ->
        {:reply, game.bet, game}

      {:error, msg} ->
        {:reply, msg, state}
    end
  end

  def handle_call(:get_bet, _from, state) do
    {:reply, state.bet, state}
  end

  def handle_call(:shuffle, _from, state) do
    case GameManager.shuffle_deck_of_card(state, 30) do
      {:ok, game} ->
        {:reply, game.shuffled_times, game}

      {:error, msg} ->
        {:reply, msg, state}
    end
  end
end
