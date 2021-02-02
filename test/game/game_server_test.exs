defmodule Game.GameServerTest do
  use ExUnit.Case, async: true
  alias Game.GameServer
  doctest War

  test "create valid bet with card-odd" do
    GameServer.start_link()
    GameServer.new_bet(%{"card-odd": "war"})
    bet = GameServer.get_bet()
    assert Bets.Bets.create_bet(%{"card-odd": "war"})
  end

  test "send twice create bet" do
    GameServer.start_link()
    GameServer.new_bet(%{"card-odd": "war"})
    msg = GameServer.new_bet(%{"card-odd": "war"})
    assert msg == "You couldn't put another bet"
  end

  test "start game before create bet should return error" do
  end

  test "try to create bet with invalid key" do
    GameServer.start_link()
    msg = GameServer.new_bet(%{invalid_kye: "war"})
    bet = GameServer.get_bet()
    assert bet == nil

    assert msg ==
             "At least one bet is required. Try [color-player, color-croupier, suit-player, suit-croupier, card-odd"
  end

  test "try to create bet with invalid value" do
    GameServer.start_link()
    msg = GameServer.new_bet(%{"card-odd": "invalid"})
    bet = GameServer.get_bet()
    assert bet == nil
    assert msg == "Invalid card-odd. Allowed: [player croupier war]"
  end
end
