defmodule Demo do
  #  @doc """
  #  Calculate fibonacci.
  #  """
  #  @aspec fibonacci(number) :: number
  def fibonacci(n) do
    fibonacci(n, 1, 0)
  end

  #  @aspec fibonacci(number, number, number) :: number
  defp fibonacci(0, _, result), do: result

  defp fibonacci(n, next, result) do
    fibonacci(n - 1, next + result, next)
  end
end

IO.puts(Demo.fibonacci(10))
