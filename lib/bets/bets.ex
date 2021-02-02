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

  def summary(bet, player_card, croupier_card, card_odd) do
    %{
      "suit-player": bet."suit-player" == player_card.suit,
      "card-odd": bet == card_odd,
      "color-croupier": bet."color-croupier" == croupier_card.color,
      "color-player": bet."color-player" == player_card.color,
      "suit-croupier": bet."suit-player" == croupier_card.suit
    }
  end
end
