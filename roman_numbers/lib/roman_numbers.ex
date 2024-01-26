defmodule RomanNumbers do
  @moduledoc """
  Documentation for `RomanNumbers`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RomanNumbers.hello()
      :world

  """
  def roman_to_int(s) do
    calculate(s,0,0, String.length(s))
  end
  
  def calculate(_s, value, pos, length) when pos == length do
    value 
  end

  def calculate(s, value, pos, length) do
    numerals = %{
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100,
      "D" => 500,
      "M" => 1000
    }
    adder = case [String.at(s,pos), String.at(s,pos+1)] do
      ["I", "V"] -> -1
      ["I", "X"] -> -1
      ["X", "L"] -> -10
      ["X", "C"] -> -10
      ["C", "D"] -> -100
      ["C", "M"] -> -100
      [aux, _tail] -> numerals[aux]
    end
    calculate(s, value + adder, pos + 1, length)
  end
end
