defmodule Game.GameTest do
  use ExUnit.Case
  alias Round.Round
  doctest War

  test "test create new empty Game" do
    game = Game.Game.new()
    assert game.bet == nil
  end

  test "test put bet if another exist should return error with information" do
    bet = %{"card-odd": "war"}
    game = %Game.Game{bet: bet}
    {:error, msg} = Game.Game.create_bet(game, bet)
    assert "You couldn't put another bet" == msg
  end

  test "test put bet if there was no bet before" do
    bet = %{"card-odd": "war"}
    game = %Game.Game{}
    {:ok, game} = Game.Game.create_bet(game, bet)
    assert game.bet."card-odd" == "war"
  end

  test "test put invalid bet should return error with information" do
    game = %Game.Game{}
    {:error, msg} = Game.Game.create_bet(game, %{})

    assert msg ==
             "At least one bet is required. Try [color-player, color-croupier, suit-player, suit-croupier, card-odd"
  end

  test "new game build deck built from 5 original decks of card" do
    game = Game.Game.new()
    assert 260 == Enum.count(game.cards)
  end

  test "game shuffle deck of card at least 30 times" do
    game = Game.Game.new() |> Game.Game.shuffle_deck_of_card()
    assert 260 = Enum.count(game.cards)
  end

  test "grab user card should set player power and returns others 259 cards" do
    game = Game.Game.new()
    card = Enum.at(game.cards, 0)
    {:ok, game} = Game.Game.grab_player_card(game)
    assert card == game.player_card
    assert 259 == Enum.count(game.cards)
  end

  test "grab player card after user card should set croupier power and returns others 258 cards" do
    game = Game.Game.new()
    {:ok, game} = Game.Game.grab_player_card(game)
    card = Enum.at(game.cards, 0)
    {:ok, game} = Game.Game.grab_croupier_card(game)
    assert card == game.croupier_card
    assert 258 == Enum.count(game.cards)
  end

  test "grab croupier card before user card should return error and information" do
    game = Game.Game.new()
    {:error, msg} = Game.Game.grab_croupier_card(game)
    assert msg == "Player grab card first"
    assert 260 == Enum.count(game.cards)
  end

  test "player cannot grab two cards in a row" do
    game = Game.Game.new()
    {:ok, game} = Game.Game.grab_player_card(game)
    {:error, msg} = Game.Game.grab_player_card(game)
    assert msg == "You can't grab another Card. Its croupier turn."
    assert 259 == Enum.count(game.cards)
  end

  test "game summary" do
    player_card = Cards.Deck.create_card("spade", "2")
    croupier_card = Cards.Deck.create_card("spade", "3")
    {:ok, bet} = Bets.Bets.create_bet(%{"card-odd": "croupier"})
    game = %Game.Game{bet: bet, player_card: player_card, croupier_card: croupier_card}
    Game.Game.game_summary(game)
  end
end
