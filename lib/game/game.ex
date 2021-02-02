defmodule Game.Game do
  defstruct bet: nil, cards: []
  alias Bets.Bets

  def new do
    %Game.Game{cards: Cards.Deck.create_deck(5)}
  end

  def create_bet(game, _) when game.bet != nil, do: {:error, "You couldn't put another bet"}

  def create_bet(game, bet) do
    case Bets.create_bet(bet) do
      {:ok, bet} ->
        {:ok, %Game.Game{game | bet: bet}}

      {:error, msg} ->
        {:error, msg}
    end
  end

  def shuffle_deck_of_card(game, times \\ 30) do
    cards = Cards.Deck.shuffle(game.cards, times)
    %Game.Game{game | cards: cards}
  end
end
