defmodule Scan do
  
  def parse(string) do
    string
    |> breakInLines
    |> getAccountChunks
    |> Enum.map(fn chunk -> parseAccountChunk chunk end)
  end

  defp breakInLines(string) do
    string
    |> String.split("\n")
    |> Enum.filter(fn line -> line !== "" end)
  end

  defp getAccountChunks(listOfLines) do
    listOfLines
    |> Enum.chunk(3)
  end

  defp parseAccountChunk(chunk) do
    chunk
    |> Enum.map(fn s -> String.to_charlist(s) end)
    |> Enum.map(fn s -> Enum.chunk(s, 3) end)
    |> Enum.zip
    |> Enum.map(fn e -> Tuple.to_list e end)
    |> Enum.map(fn e -> Enum.join e, "" end)
    |> Enum.map(fn s -> parseNumberString s end)
    |> Enum.join("")
  end

  defp parseNumberString(string) when string == "     |  |" do
    1
  end

  defp parseNumberString(string) when string == " _  _||_ " do
    2
  end

  defp parseNumberString(string) when string == " _  _| _|" do
    3
  end

  defp parseNumberString(string) when string == "   |_|  |" do
    4
  end

  defp parseNumberString(string) when string == " _ |_  _|" do
    5
  end

  defp parseNumberString(string) when string == " _ |_ |_|" do
    6
  end

  defp parseNumberString(string) when string == " _   |  |" do
    7
  end

  defp parseNumberString(string) when string == " _ |_||_|" do
    8
  end

  defp parseNumberString(string) when string == " _ |_| _|" do
    9
  end

  defp parseNumberString(string) when string == " _ | ||_|" do
    0
  end

  defp parseNumberString(string) do
    raise ArgumentError, "#{string} dosent match any know number string."
  end
end
