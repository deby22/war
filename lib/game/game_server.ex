defmodule Game.GameServer do
  use GenServer
  @name GameServer
  alias Game.GameManager

  def start_link, do: GenServer.start_link(__MODULE__, :ok, name: @name)
  def init(_), do: GameManager.new_game()

  # Client
  def new_bet(bet) when is_map(bet) do
    GenServer.call(@name, {:new_bet, bet})
  end

  def get_bet do
    GenServer.call(@name, :get_bet)
  end

  def shuffle_cards do
    GenServer.cast(@name, :shuffle)
  end

  def get_shuffled_times do
    GenServer.call(@name, :get_shuffled_times)
  end

  # Server

  def handle_call(:get_shuffled_times, _from, state) do
    IO.inspect(state)
    {:reply, state.shuffled_times, state}
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

  def handle_cast(:shuffle, state) do
    {:ok, game} = GameManager.shuffle_deck_of_card(state, 30)
    {:noreply, game}
  end
end
