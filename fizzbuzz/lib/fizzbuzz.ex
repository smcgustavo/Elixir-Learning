defmodule Fizzbuzz do
  @moduledoc """ 
    Fizzbuzz is a simple exercise for map function.
    A number that is multiple of 3 is replaced by the word Fizz.
    And a number that is multiple of 5 is replaced by the word Buzz.
    If the number is multiple of both 5 and 3, it's replaced by FizzBuzz.
  """
  def is_multiple(number) do
    cond do
      rem(number, 3) == 0 and rem(number,5) == 0 -> 'FizzBuzz'
      rem(number, 3) == 0 -> 'Fizz'
      rem(number,5) == 0 -> 'Buzz'
      true -> number
    end
  end
  def read(file_name) do
    file = File.read(file_name)
    case file do
      {:ok, list} -> String.split(String.replace(list, "\n", ""), ",")
      {:error, _} -> "File does not exist"
    end
  end
  
  def fizzbuzz(file_name) do
    read(file_name)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&is_multiple/1)
  end

end
