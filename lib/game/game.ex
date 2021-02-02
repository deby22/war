defmodule Game.Game do
  defstruct bet: nil
  alias Bets.Bets

  def new, do: %Game.Game{}

  def create_bet(game, _) when game.bet != nil, do: {:error, "You couldn't put another bet"}

  def create_bet(game, bet) do
    case Bets.create_bet(bet) do
      {:ok, bet} ->
        {:ok, %Game.Game{game | bet: bet}}

      {:error, msg} ->
        {:error, msg}
    end
  end
end
