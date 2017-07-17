defmodule ScanTest do
  use ExUnit.Case
  doctest Scan


  test "parse string" do
    string = """
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
  """
    assert Scan.parse( string ) == 1
  end

  test "split numbers from string" do
    string = "    _ \n" <>
             "  | _|\n" <>
             "  ||_ "

    assert Scan.split(string) == ["     |  |", " _  _||_ "]
  end
end

