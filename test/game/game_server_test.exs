defmodule Game.GameServerTest do
  use ExUnit.Case, async: true
  alias Game.GameServer

  doctest Game

  test "create valid bet with card-odd" do
    GameServer.start_link()
    Game.new_bet(%{"card-odd": "war"})
    assert Bets.Bets.create_bet(%{"card-odd": "war"})
  end

  test "send twice create bet" do
    GameServer.start_link()
    Game.new_bet(%{"card-odd": "war"})
    msg = Game.new_bet(%{"card-odd": "war"})
    assert msg == "You couldn't put another bet"
  end

  test "start game before create bet should return error" do
  end

  test "try to create bet with invalid key" do
    GameServer.start_link()
    msg = Game.new_bet(%{invalid_kye: "war"})
    bet = Game.get_bet()
    assert bet == nil

    assert msg ==
             "At least one bet is required. Try [color-player, color-croupier, suit-player, suit-croupier, card-odd"
  end

  test "try to create bet with invalid value" do
    GameServer.start_link()
    msg = Game.new_bet(%{"card-odd": "invalid"})
    bet = Game.get_bet()
    assert bet == nil
    assert msg == "Invalid card-odd. Allowed: [player croupier war]"
  end

  test "shuffle deck of card" do
    GameServer.start_link()
    Game.new_bet(%{"card-odd": "war"})
    Game.shuffle_cards()
    assert 30 == Game.get_shuffled_times()
    Game.shuffle_cards()
    assert 60 == Game.get_shuffled_times()
  end

  test "shuffle deck of card before bet should return error" do
    GameServer.start_link()
    Game.shuffle_cards()
    assert 0 == Game.get_shuffled_times()
  end

  test "grab user card" do
    GameServer.start_link()
    Game.new_bet(%{"card-odd": "war"})
    Game.shuffle_cards()
    card = Game.grab_player_card()
    assert card.power in 1..11
  end

  test "grab before bet should return error" do
    GameServer.start_link()
    msg = Game.grab_player_card()
    assert msg == "Shuffle card before game"
  end

  test "grab croupier card before player should return error" do
    GameServer.start_link()
    Game.new_bet(%{"card-odd": "war"})
    Game.shuffle_cards()
    msg = Game.grab_croupier_card()
    assert msg == "Player grab card first"
  end

  test "grab croupier card after player should return croupier card" do
    GameServer.start_link()
    Game.new_bet(%{"card-odd": "war"})
    Game.shuffle_cards()
    Game.grab_player_card()
    card = Game.grab_croupier_card()
    assert card.power in 1..11
  end
end
