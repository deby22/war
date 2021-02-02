defmodule Bets.Bets do
  alias Bets.Bet

  def create_bet(bet) do
    try do
      {:ok, Bet.validate_bet(struct(Bets.Bet, bet))}
    rescue
      e in ValidationError ->
        {:error, e.message}
    end
  end
end
