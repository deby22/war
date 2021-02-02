defmodule Game.Game do
  defstruct bet: nil, cards: [], player_card: nil, croupier_card: nil
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

  def grab_player_card(game) when game.player_card != nil do
    {:error, "You can't grab another Card. Its croupier turn."}
  end

  def grab_player_card(game) do
    [grabbed | others] = game.cards
    game = %Game.Game{game | cards: others}
    {:ok, %Game.Game{game | player_card: grabbed}}
  end

  def game_summary(game) do
    %{
      round_summary: round_summary(game),
      bet_summary: bet_summary(game)
    }
  end

  defp bet_summary(game) do
    game
  end

  defp round_summary(game) do
    case Round.Round.play(game.player_card.power, game.croupier_card.power) do
      "war" -> "war"
      other -> "Round won: #{other}"
    end
  end


  def grab_croupier_card(game) when game.player_card == nil do
    {:error, "Player grab card first"}
  end

  def grab_croupier_card(game) do
    [grabbed | others] = game.cards
    game = %Game.Game{game | cards: others}
    {:ok, %Game.Game{game | croupier_card: grabbed}}
  end
end
