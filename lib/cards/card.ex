defmodule Cards.Card do
  defstruct color: nil, suit: nil, value: nil, power: nil

  def new(suit, value) do
    %Cards.Card{
      suit: suit,
      value: value,
      power: get_power_by_value(value),
      color: get_color_by_suit(suit)
    }
  end

  defp get_color_by_suit(suit) when suit in ["heart", "diamond"], do: "red"
  defp get_color_by_suit(suit) when suit in ["club", "spade"], do: "black"

  defp get_power_by_value(value) when value == "A", do: 11
  defp get_power_by_value(value) when value in ["J", "Q", "K"], do: 10
  defp get_power_by_value(value) when value in 1..10, do: value
end
