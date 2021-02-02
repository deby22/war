defmodule Cards.Deck do
  alias Cards.Card

  def create_card(suit, value) do
    Card.new(suit, value)
  end
end
