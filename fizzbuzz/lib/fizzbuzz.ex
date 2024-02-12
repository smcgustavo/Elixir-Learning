defmodule Fizzbuzz do
  @moduledoc """ 
    Fizzbuzz is a simple exercise for map function.
    A number that is multiple of 3 is replaced by the word Fizz.
    And a number that is multiple of 5 is replaced by the word Buzz.
    If the number is multiple of both 5 and 3, it's replaced by FizzBuzz.
  """
  defp is_multiple(number) do
    cond do
      rem(number, 3) == 0 and rem(number,5) == 0 -> 'FizzBuzz'
      rem(number, 3) == 0 -> 'Fizz'
      rem(number,5) == 0 -> 'Buzz'
      true -> number
    end
  end
 
 defp handle_file({:ok, file}) do
    result = 
    file
    |> String.replace("\n", "")
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&is_multiple/1)
    {:ok, result}
  end
  
  defp handle_file({:error, reason}), do: {:error, "Error reading file: #{reason}"}
  
  def main(file_name) do
    file_name
    |> File.read
    |> handle_file 
  end

end
