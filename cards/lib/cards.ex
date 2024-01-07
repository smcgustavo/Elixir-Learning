defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  @doc """
    Make a deck hand
  """
  def create_deck do 
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end
  @doc """
    Deal returns the first `hand_size` number of cards
    
  ## Example

      iex> deck = Cards.create_deck
      iex> hand = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """ 
  def deal(deck, hand_size) do
    {hand, _rest} = Enum.split(deck, hand_size) 
    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end    
  
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason }-> "Error loading file. #{reason}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck) 
  end
  
  @doc """
    Determines whether a deck contains a given card

  ## Examples
      
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
      
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def make_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
