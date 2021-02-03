# War

## Description

Simulate War Game with simple bet.
User can put bet, shuffling card and play agains croupier.

# Important

* Bet is required before the play
* Before grabbing card user have to tell croupier to shuffling the card
* Player grab card first.
* After 3 seconds of grabbing card by croupier player will see results
* After Game starts new game

## Usage

Open iex terminal
```bash
iex -S mix
```

```elixir
# Start supervisor 
{:ok, pid} = Game.Application.start([], [])

# put new bet
Game.new_bet(%{"card-odd": "war"})

# shuffling card before round
Game.shuffle_cards

# grab player card
Game.grab_player_card

# grab croupier card
Game.grab_croupier_card
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `war` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:war, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/war](https://hexdocs.pm/war).

