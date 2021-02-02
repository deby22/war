defmodule Bets.Bet do
  defstruct "suit-player": nil,
            "card-odd": nil,
            "color-croupier": nil,
            "color-player": nil,
            "suit-croupier": nil

  def validate_bet(bet = %Bets.Bet{}) do
    bet
    |> validate_suit_player()
    |> validate_suit_croupier()
    |> validate_card_odd()
    |> validate_color_player()
    |> validate_color_croupier()
    |> validate_at_least_one_bet()
  end

  defp validate_at_least_one_bet(bet = %Bets.Bet{}) do
    if !(bet."suit-player" || bet."suit-croupier" || bet."card-odd" || bet."color-croupier" ||
           bet."color-player") do
      raise ValidationError,
            "At least one bet is required. Try [color-player, color-croupier, suit-player, suit-croupier, card-odd"
    else
      bet
    end
  end

  defp validate_suit_player(bet = %Bets.Bet{"suit-player": suit})
       when suit == nil or suit in ~w"heart diamond club spade",
       do: bet

  defp validate_suit_player(%Bets.Bet{"suit-player": _}),
    do: raise(ValidationError, "Invalid suit-player. Allowed: [heart diamond club spade]")

  defp validate_suit_croupier(bet = %Bets.Bet{"suit-croupier": suit})
       when suit == nil or suit in ~w"heart diamond club spade",
       do: bet

  defp validate_suit_croupier(%Bets.Bet{"suit-croupier": _}),
    do: raise(ValidationError, "Invalid suit-croupier. Allowed: [heart diamond club spade]")

  defp validate_color_croupier(bet = %Bets.Bet{"color-croupier": color})
       when color == nil or color in ~w"black red",
       do: bet

  defp validate_color_croupier(%Bets.Bet{"color-croupier": _}),
    do: raise(ValidationError, "Invalid color-croupier. Allowed: [black red]")

  defp validate_color_player(bet = %Bets.Bet{"color-player": color})
       when color == nil or color in ~w"black red",
       do: bet

  defp validate_color_player(%Bets.Bet{"color-player": _}),
    do: raise(ValidationError, "Invalid color-player. Allowed: [black red]")

  defp validate_card_odd(bet = %Bets.Bet{"card-odd": card_odd})
       when card_odd == nil or card_odd in ~w"player croupier war",
       do: bet

  defp validate_card_odd(%Bets.Bet{"card-odd": _}),
    do: raise(ValidationError, "Invalid card-odd. Allowed: [player croupier war]")
end
