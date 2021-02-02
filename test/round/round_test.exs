defmodule Round.RoundTest do
  use ExUnit.Case
  alias Round.Round
  doctest War

  test "player won" do
    assert "player" == Round.play(10, 1)
  end

  test "cropier won" do
    assert "croupier" == Round.play(1, 10)
  end

  test "draw - which mean war" do
    assert "war" == Round.play(10, 10)
  end
end
