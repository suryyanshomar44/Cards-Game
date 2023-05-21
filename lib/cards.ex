defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling a deck of card
  """
  @doc """
    Return a list of strings representing a deck of playing cards
  """
  def create_deck do
    values=["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Queen","King"]
    suits=["Spades","Hearts","Clubs","Diamonds"]
    
    # hello 
    # cards= for value <- values do
    #         for suit <- suits do
    #           "#{value} of #{suit}"
    #         end
    #       end
    # List.flatten(cards)

    for value<-values, suit<-suits do
      "#{value} of #{suit}"
    end


  end

  
  @doc """
    Divide a deck into a hand and the remainder of the deck. 
    The `hand_size` argument indicates how many cards should 
    be in the hand.
  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determines whether deck contains a given card

  ## Exapmles

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true  

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # {status, binary} = File.read(filename)
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)   #ok is an atom
    #   :error -> "File does not exist"
    # end
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "File does not exist"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # _hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)

  end
  def deck_length(deck) do
    length(deck)
  end

end
