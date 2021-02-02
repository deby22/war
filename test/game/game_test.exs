defmodule Game.GameTest do
  use ExUnit.Case
  alias Game.Game
  doctest War

  test "player won" do
    assert "player" == Game.game(10, 1)
  end

  test "cropier won" do
    assert "croupier" == Game.game(1, 10)
  end

  test "draw - which mean war" do
    assert "war" == Game.game(10, 10)
  end
end
