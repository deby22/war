defmodule Cards.Deck do
  alias Cards.Card
  @values ~w[2 3 4 5 6 7 8 9 10 J Q K A]
  @suits ~w[club heart spade diamond]
  def create_card(suit, value) do
    Card.new(suit, value)
  end

  def create_deck do
    for suit <- @suits, value <- @values, do: Card.new(suit, value)
  end
end
