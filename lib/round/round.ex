defmodule Round.Round do
  def play(player_power, croupier_power) when player_power > croupier_power, do: "player"
  def play(player_power, croupier_power) when player_power < croupier_power, do: "croupier"
  def play(player_power, croupier_power) when player_power == croupier_power, do: "war"
end
