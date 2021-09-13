defmodule App do

  def hello do
    :world
  end

  def multiple_by_two([]), do: []
  def multiple_by_two([head | tail]) do
    [head * 2 | multiple_by_two(tail)]
  end

  def count([]), do: 1
  def count(children) do
    [first | tail] = children
    count(first) + count(tail)
  end

  def count2(%{children: []}), do: 1
  def count2(%{children: children}) do
    [first | tail] = children
    count(first) + count(%{children: tail})
  end

end
