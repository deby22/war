defmodule Game do
  @moduledoc """
    Client for GameServer
  """
  alias Game.GameServer
  def new_bet(bet) when is_map(bet), do: GameServer.new_bet(bet)
  def get_bet, do: GameServer.get_bet()
  def shuffle_cards, do: GameServer.shuffle_cards()
  def get_shuffled_times, do: GameServer.get_shuffled_times()
  def grab_player_card, do: GameServer.grab_player_card()
  def grab_croupier_card, do: GameServer.grab_croupier_card()
end
