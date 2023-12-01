defmodule AdventOfCodeEx.Core.Days.Day1 do


  def part_1(input) do
    input
    |> String.split("\r\n")
    |> Enum.map(&map_to_freq/1)
    |> Enum.sum()
  end

  def part_2(input) do
    input
    |> String.split("\r\n")
    |> Enum.map(&map_to_freq2/1)
    |> Enum.sum()
  end

  def map_to_freq(str) do
    Regex.scan(~r/([0-9]{1})/, str, capture: :first)
    |> List.flatten
    |> then(fn x -> List.first(x) <> List.last(x) end)
    |> String.to_integer()
  end

  def map_to_freq2(str) do
    Regex.scan(~r/(?=([0-9]{1}|one|two|three|four|five|six|seven|eight|nine))/, str)
    |> Enum.map(fn [_x, y] -> y end)
    |> then(fn x -> to_num(List.first(x)) <> to_num(List.last(x)) end)
    |> String.to_integer()
  end

  def to_num(str) do
    case str do
      "one" -> "1"
      "two" -> "2"
      "three" -> "3"
      "four" -> "4"
      "five" -> "5"
      "six" -> "6"
      "seven" -> "7"
      "eight" -> "8"
      "nine" -> "9"
      x -> x
    end
  end
end
