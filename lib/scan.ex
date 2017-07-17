defmodule Scan do
  
  def parse(string) do
    1
  end

  def split(string) do
    string
    |> String.split("\n")
    |> Enum.map(fn s -> String.to_charlist(s) end)
    |> Enum.map(fn s -> Enum.chunk(s, 3) end)
    |> Enum.map(fn l -> [head] = l end)
  end
end
