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

  def shuffle(cards), do: Enum.shuffle(cards)
  def shuffle(cards, times) when times <= 0, do: shuffle(cards)
  def shuffle(cards, times), do: shuffle(cards, times - 1)

  def pick_one([picked | other_cards]), do: %{card: picked, deck: other_cards}
end
