defmodule Game.GameManagerTest do
  use ExUnit.Case
  alias Round.Round
  alias Game.GameManager
  doctest War

  test "create new_game empty Game" do
    {:ok, game} = GameManager.new_game()
    assert game.bet == nil
  end

  test "put bet if another exist should return error with information" do
    bet = %{"card-odd": "war"}
    {:ok, game} = GameManager.new_game()
    {:ok, game} = GameManager.create_bet(game, bet)
    {:error, msg} = GameManager.create_bet(game, bet)
    assert "You couldn't put another bet" == msg
  end

  test "put bet if there was no bet before" do
    bet = %{"card-odd": "war"}
    {:ok, game} = GameManager.new_game()
    {:ok, game} = GameManager.create_bet(game, bet)
    assert game.bet."card-odd" == "war"
  end

  test "put invalid bet should return error with information" do
    {:ok, game} = GameManager.new_game()
    {:error, msg} = GameManager.create_bet(game, %{})

    assert msg ==
             "At least one bet is required. Try [color-player, color-croupier, suit-player, suit-croupier, card-odd"
  end

  test "new_game game build deck built from 5 original decks of card" do
    {:ok, game} = GameManager.new_game()
    assert 260 == Enum.count(game.cards)
  end

  test "game shuffle deck of card at least 30 times" do
    {:ok, game} = GameManager.new_game()
    {:ok, game} = GameManager.shuffle_deck_of_card(game)
    assert 260 = Enum.count(game.cards)
  end

  test "grab user card should set player power and returns others 259 cards" do
    bet = %{"card-odd": "croupier"}
    {:ok, game} = GameManager.new_game()
    {:ok, game} = GameManager.create_bet(game, bet)
    card = Enum.at(game.cards, 0)
    {:ok, game} = GameManager.grab_player_card(game)
    assert card == game.player_card
    assert 259 == Enum.count(game.cards)
  end

  test "grab player card after user card should set croupier power and returns others 258 cards" do
    bet = %{"card-odd": "croupier"}
    {:ok, game} = GameManager.new_game()
    {:ok, game} = GameManager.create_bet(game, bet)
    {:ok, game} = GameManager.grab_player_card(game)
    card = Enum.at(game.cards, 0)
    {:ok, game} = GameManager.grab_croupier_card(game)
    assert card == game.croupier_card
    assert 258 == Enum.count(game.cards)
  end

  test "grab croupier card before user card should return error and information" do
    {:ok, game} = GameManager.new_game()
    {:error, msg} = GameManager.grab_croupier_card(game)
    assert msg == "Player grab card first"
    assert 260 == Enum.count(game.cards)
  end

  test "player cannot grab two cards in a row" do
    bet = %{"card-odd": "croupier"}
    {:ok, game} = GameManager.new_game()
    {:ok, game} = GameManager.create_bet(game, bet)
    {:ok, game} = GameManager.grab_player_card(game)
    {:error, msg} = GameManager.grab_player_card(game)
    assert msg == "You can't grab another Card. Its croupier turn."
    assert 259 == Enum.count(game.cards)
  end

  # test "game summary" do
  #   player_card = Cards.Deck.create_card("spade", "2")
  #   croupier_card = Cards.Deck.create_card("spade", "3")
  #   {:ok, bet} = Bets.Bets.create_bet(%{"card-odd": "croupier"})
  #   game = %Game.Game{bet: bet, player_card: player_card, croupier_card: croupier_card}
  #   Game.Game.game_summary(game)
  # end

  test "grab card before betting should return error" do
    {:ok, game} = GameManager.new_game()
    {:error, msg} = GameManager.grab_player_card(game)
    assert msg = "You can't grab card before bet"
  end
end
