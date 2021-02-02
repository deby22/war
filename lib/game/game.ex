defmodule Game.Game do
  def game(player_power, croupier_power) when player_power > croupier_power, do: "player"
  def game(player_power, croupier_power) when player_power < croupier_power, do: "croupier"
  def game(player_power, croupier_power) when player_power == croupier_power, do: "war"
end
