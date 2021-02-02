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

  # Server
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
end
