defmodule Game.Game do
  defstruct bet: nil, cards: [], player_card: nil, croupier_card: nil
  alias Game.Game
  alias Cards.Deck

  def new, do: %Game{cards: Deck.create_deck(5)}
  def create_bet(game, bet), do: %Game{game | bet: bet}

  def shuffle_deck_of_card(game, times \\ 30) do
    cards = Deck.shuffle(game.cards, times)
    %Game{game | cards: cards}
  end

  def grab_player_card(game) do
    [grabbed | others] = game.cards
    game = %Game{game | cards: others}
    %Game{game | player_card: grabbed}
  end

  def grab_croupier_card(game) do
    [grabbed | others] = game.cards
    game = %Game{game | cards: others}
    %Game{game | croupier_card: grabbed}
  end
end
