defmodule Game.Game do
  defstruct bet: nil, cards: [], player_value: nil, croupier_value: nil
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

  def grab_player_card(game) when game.player_value != nil do
    {:error, "You can't grab another Card. Its croupier turn."}
  end

  def grab_player_card(game) do
    [grabbed | others] = game.cards
    game = %Game.Game{game | cards: others}
    {:ok, %Game.Game{game | player_value: grabbed.power}}
  end

  def grab_croupier_card(game) when game.player_value == nil do
    {:error, "Player grab card first"}
  end

  def grab_croupier_card(game) do
    [grabbed | others] = game.cards
    game = %Game.Game{game | cards: others}
    {:ok, %Game.Game{game | croupier_value: grabbed.power}}
  end
end
