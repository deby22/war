defmodule Cards.CardsTest do
  use ExUnit.Case
  alias Cards.Card
  alias Cards.Deck
  doctest War

  test "Create a spades cards" do
    # spades - black
    assert %Card{suit: "spade", value: 1, power: 1, color: "black"} == Deck.create_card("spade", 1)
    assert %Card{suit: "spade", value: 2, power: 2, color: "black"} == Deck.create_card("spade", 2)
    assert %Card{suit: "spade", value: 3, power: 3, color: "black"} == Deck.create_card("spade", 3)
    assert %Card{suit: "spade", value: 4, power: 4, color: "black"} == Deck.create_card("spade", 4)
    assert %Card{suit: "spade", value: 5, power: 5, color: "black"} == Deck.create_card("spade", 5)
    assert %Card{suit: "spade", value: 6, power: 6, color: "black"} == Deck.create_card("spade", 6)
    assert %Card{suit: "spade", value: 7, power: 7, color: "black"} == Deck.create_card("spade", 7)
    assert %Card{suit: "spade", value: 8, power: 8, color: "black"} == Deck.create_card("spade", 8)
    assert %Card{suit: "spade", value: 9, power: 9, color: "black"} == Deck.create_card("spade", 9)
    assert %Card{suit: "spade", value: 10, power: 10, color: "black"} == Deck.create_card("spade", 10)
    assert %Card{suit: "spade", value: "J", power: 10, color: "black"} == Deck.create_card("spade", "J")
    assert %Card{suit: "spade", value: "Q", power: 10, color: "black"} == Deck.create_card("spade", "Q")
    assert %Card{suit: "spade", value: "K", power: 10, color: "black"} == Deck.create_card("spade", "K")
    assert %Card{suit: "spade", value: "A", power: 11, color: "black"} == Deck.create_card("spade", "A")
  end

  test "Create a clubes cards" do
    # clubes - black
    assert %Card{suit: "club", value: 1, power: 1, color: "black"} == Deck.create_card("club", 1)
    assert %Card{suit: "club", value: 2, power: 2, color: "black"} == Deck.create_card("club", 2)
    assert %Card{suit: "club", value: 3, power: 3, color: "black"} == Deck.create_card("club", 3)
    assert %Card{suit: "club", value: 4, power: 4, color: "black"} == Deck.create_card("club", 4)
    assert %Card{suit: "club", value: 5, power: 5, color: "black"} == Deck.create_card("club", 5)
    assert %Card{suit: "club", value: 6, power: 6, color: "black"} == Deck.create_card("club", 6)
    assert %Card{suit: "club", value: 7, power: 7, color: "black"} == Deck.create_card("club", 7)
    assert %Card{suit: "club", value: 8, power: 8, color: "black"} == Deck.create_card("club", 8)
    assert %Card{suit: "club", value: 9, power: 9, color: "black"} == Deck.create_card("club", 9)
    assert %Card{suit: "club", value: 10, power: 10, color: "black"} == Deck.create_card("club", 10)
    assert %Card{suit: "club", value: "J", power: 10, color: "black"} == Deck.create_card("club", "J")
    assert %Card{suit: "club", value: "Q", power: 10, color: "black"} == Deck.create_card("club", "Q")
    assert %Card{suit: "club", value: "K", power: 10, color: "black"} == Deck.create_card("club", "K")
    assert %Card{suit: "club", value: "A", power: 11, color: "black"} == Deck.create_card("club", "A")
  end

  test "Create a hearts cards" do
    # hearts - red
    assert %Card{suit: "heart", value: 1, power: 1, color: "red"} == Deck.create_card("heart", 1)
    assert %Card{suit: "heart", value: 2, power: 2, color: "red"} == Deck.create_card("heart", 2)
    assert %Card{suit: "heart", value: 3, power: 3, color: "red"} == Deck.create_card("heart", 3)
    assert %Card{suit: "heart", value: 4, power: 4, color: "red"} == Deck.create_card("heart", 4)
    assert %Card{suit: "heart", value: 5, power: 5, color: "red"} == Deck.create_card("heart", 5)
    assert %Card{suit: "heart", value: 6, power: 6, color: "red"} == Deck.create_card("heart", 6)
    assert %Card{suit: "heart", value: 7, power: 7, color: "red"} == Deck.create_card("heart", 7)
    assert %Card{suit: "heart", value: 8, power: 8, color: "red"} == Deck.create_card("heart", 8)
    assert %Card{suit: "heart", value: 9, power: 9, color: "red"} == Deck.create_card("heart", 9)
    assert %Card{suit: "heart", value: 10, power: 10, color: "red"} == Deck.create_card("heart", 10)
    assert %Card{suit: "heart", value: "J", power: 10, color: "red"} == Deck.create_card("heart", "J")
    assert %Card{suit: "heart", value: "Q", power: 10, color: "red"} == Deck.create_card("heart", "Q")
    assert %Card{suit: "heart", value: "K", power: 10, color: "red"} == Deck.create_card("heart", "K")
    assert %Card{suit: "heart", value: "A", power: 11, color: "red"} == Deck.create_card("heart", "A")
  end

  test "Create a diamonds cards" do
    # diamonds - red
    assert %Card{suit: "diamond", value: 1, power: 1, color: "red"} == Deck.create_card("diamond", 1)
    assert %Card{suit: "diamond", value: 2, power: 2, color: "red"} == Deck.create_card("diamond", 2)
    assert %Card{suit: "diamond", value: 3, power: 3, color: "red"} == Deck.create_card("diamond", 3)
    assert %Card{suit: "diamond", value: 4, power: 4, color: "red"} == Deck.create_card("diamond", 4)
    assert %Card{suit: "diamond", value: 5, power: 5, color: "red"} == Deck.create_card("diamond", 5)
    assert %Card{suit: "diamond", value: 6, power: 6, color: "red"} == Deck.create_card("diamond", 6)
    assert %Card{suit: "diamond", value: 7, power: 7, color: "red"} == Deck.create_card("diamond", 7)
    assert %Card{suit: "diamond", value: 8, power: 8, color: "red"} == Deck.create_card("diamond", 8)
    assert %Card{suit: "diamond", value: 9, power: 9, color: "red"} == Deck.create_card("diamond", 9)
    assert %Card{suit: "diamond", value: 10, power: 10, color: "red"} == Deck.create_card("diamond", 10)
    assert %Card{suit: "diamond", value: "J", power: 10, color: "red"} == Deck.create_card("diamond", "J")
    assert %Card{suit: "diamond", value: "Q", power: 10, color: "red"} == Deck.create_card("diamond", "Q")
    assert %Card{suit: "diamond", value: "K", power: 10, color: "red"} == Deck.create_card("diamond", "K")
    assert %Card{suit: "diamond", value: "A", power: 11, color: "red"} == Deck.create_card("diamond", "A")
  end

end
