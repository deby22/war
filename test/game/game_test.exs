defmodule Game.GameTest do
  use ExUnit.Case
  alias Round.Round
  doctest War

  test "test create new empty Game" do
    assert Game.Game.new() == %Game.Game{}
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

  test "game create deck built from 5 original decks of card" do
    game = Game.Game.new()
    game = Game.Game.create_deck_of_card(game)
    assert 260 == Enum.count(game.cards)
  end
end
