defmodule Game.GameManager do
  alias Bets.Bets
  alias Game.Game

  def new_game, do: {:ok, Game.new()}

  def create_bet(game, _) when game.bet != nil, do: {:error, "You couldn't put another bet"}

  def create_bet(game, bet) do
    case Bets.create_bet(bet) do
      {:ok, bet} ->
        {:ok, Game.create_bet(game, bet)}

      {:error, msg} ->
        {:error, msg}
    end
  end

  def shuffle_deck_of_card(game, _) when game.bet == nil,
    do: {:error, "Put bet before shuffling cards"}

  def shuffle_deck_of_card(game, times \\ 30), do: {:ok, Game.shuffle_deck_of_card(game, times)}

  def grab_player_card(game) when game.shuffled_times == 0 do
    {:error, "Shuffle card before game"}
  end

  def grab_player_card(game) when game.bet == nil do
    {:error, "You can't grab card before bet"}
  end

  def grab_player_card(game) when game.player_card != nil do
    {:error, "You can't grab another Card. Its croupier turn."}
  end

  def grab_player_card(game), do: {:ok, Game.grab_player_card(game)}

  def game_summary(game) do
    {:ok,
     %{
       round_summary: round_summary(game),
       bet_summary: bet_summary(game),
       player_card: game.player_card,
       croupier_card: game.croupier_card
     }}
  end

  defp bet_summary(game) do
    card_odd = Round.Round.play(game.player_card.power, game.croupier_card.power)
    Bets.summary(game.bet, game.player_card, game.croupier_card, card_odd)
  end

  defp round_summary(game) do
    case Round.Round.play(game.player_card.power, game.croupier_card.power) do
      "war" -> "war"
      other -> "Round won: #{other}"
    end
  end

  def grab_croupier_card(game) when game.player_card == nil do
    {:error, "Player grab card first"}
  end

  def grab_croupier_card(game), do: {:ok, Game.grab_croupier_card(game)}
end
