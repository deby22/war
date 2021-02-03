defmodule Game.GameTest do
  use ExUnit.Case
  alias Game.Game
  doctest Game

  test "create new_game empty Game" do
    game = Game.new()
    assert game.bet == nil
  end

  test "put bet if there was no bet before" do
    bet = %{"card-odd": "war"}
    game = Game.new()
    game = Game.create_bet(game, bet)
    assert game.bet."card-odd" == "war"
  end

  test "game shuffle deck of card at least 30 times" do
    game = Game.new()
    game = Game.shuffle_deck_of_card(game)
    assert game.shuffled_times == 30
    assert 260 = Enum.count(game.cards)
  end

  test "grab user card should set player card and returns others 259 cards" do
    bet = %{"card-odd": "croupier"}
    game = Game.new()
    game = Game.create_bet(game, bet)
    card = Enum.at(game.cards, 0)
    game = Game.grab_player_card(game)
    assert card == game.player_card
    assert 259 == Enum.count(game.cards)
  end

  test "grab croupier card should set croupier card and returns others 259 cards" do
    bet = %{"card-odd": "croupier"}
    game = Game.new()
    game = Game.create_bet(game, bet)
    card = Enum.at(game.cards, 0)
    game = Game.grab_croupier_card(game)
    assert card == game.croupier_card
    assert 259 == Enum.count(game.cards)
  end
end
