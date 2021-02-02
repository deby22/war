defmodule Bets.BetsTest do
  use ExUnit.Case
  alias Bets.Bets
  doctest War

  test "create bet when given valid suit-player" do
    {:ok, bet} = Bets.create_bet(%{"suit-player": "diamond"})
    assert bet."suit-player" == "diamond"

    {:ok, bet} = Bets.create_bet(%{"suit-player": "heart"})
    assert bet."suit-player" == "heart"

    {:ok, bet} = Bets.create_bet(%{"suit-player": "club"})
    assert bet."suit-player" == "club"

    {:ok, bet} = Bets.create_bet(%{"suit-player": "spade"})
    assert bet."suit-player" == "spade"
  end

  test "create bet when givven invalid suit-plyer" do
    {:error, message} = Bets.create_bet(%{"suit-player": "invalid"})
    assert message == "Invalid suit-player. Allowed: [heart diamond club spade]"
  end

  test "create bet when given valid card-odd and suit-croupier" do
    {:ok, bet} = Bets.create_bet(%{"suit-croupier": "diamond"})
    assert bet."suit-croupier" == "diamond"

    {:ok, bet} = Bets.create_bet(%{"suit-croupier": "heart"})
    assert bet."suit-croupier" == "heart"

    {:ok, bet} = Bets.create_bet(%{"suit-croupier": "club"})
    assert bet."suit-croupier" == "club"

    {:ok, bet} = Bets.create_bet(%{"suit-croupier": "spade"})
    assert bet."suit-croupier" == "spade"
  end

  test "create bet when given invalid suit-croupier" do
    {:error, message} = Bets.create_bet(%{"suit-croupier": "invalid"})
    assert message == "Invalid suit-croupier. Allowed: [heart diamond club spade]"
  end

  test "create bet when given valid color player" do
    {:ok, bet} = Bets.create_bet(%{"color-player": "black"})
    assert bet."color-player" == "black"
    {:ok, bet} = Bets.create_bet(%{"color-player": "red"})
    assert bet."color-player" == "red"
  end

  test "create bet when given invalid color player" do
    {:error, message} = Bets.create_bet(%{"color-player": "invalid"})
    assert message == "Invalid color-player. Allowed: [black red]"
  end

  test "create bet when given valid color croupier" do
    {:ok, bet} = Bets.create_bet(%{"color-croupier": "black"})
    assert bet."color-croupier" == "black"
    {:ok, bet} = Bets.create_bet(%{"color-croupier": "red"})
    assert bet."color-croupier" == "red"
  end

  test "create bet when given invalid color croupier" do
    {:error, message} = Bets.create_bet(%{"color-croupier": "invalid"})
    assert message == "Invalid color-croupier. Allowed: [black red]"
  end

  test "create bet when given valid card-odd" do
    {:ok, bet} = Bets.create_bet(%{"card-odd": "player"})
    assert bet."card-odd" == "player"
    {:ok, bet} = Bets.create_bet(%{"card-odd": "croupier"})
    assert bet."card-odd" == "croupier"
    {:ok, bet} = Bets.create_bet(%{"card-odd": "war"})
    assert bet."card-odd" == "war"
  end

  test "create bet when given invalid card-odd" do
    {:error, message} = Bets.create_bet(%{"card-odd": "invalid"})
    assert message == "Invalid card-odd. Allowed: [player croupier war]"
  end

  test "create bet witout any position" do
    {:error, message} = Bets.create_bet(%{})
    assert message == "At least one bet is required. Try [color-player, color-croupier, suit-player, suit-croupier, card-odd"
  end
end
