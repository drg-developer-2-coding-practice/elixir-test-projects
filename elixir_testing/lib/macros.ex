defmodule Macros do

  # ----------------------------------------------------------------------------
  # region Unless
  # ----------------------------------------------------------------------------

  def fun_unless(clause, do: expression) do
    if(!clause, do: expression)
  end

  defmacro macro_unless(clause, do: expression) do
    quote do
      if(!unquote(clause), do: unquote(expression))
    end
  end

  # ----------------------------------------------------------------------------
  # region Ternary Operator
  # ----------------------------------------------------------------------------

  @doc """
  Ternary operator (if-ternary).

    Expressed as:                     if condition ||| true_expr | false_expr
    Expressed in other languages as:  condition ? true_expr : false_expr

  Parameters:
    condition - Test condition.
    true_expr - Expression returned if condition is true.
    false_expr - Expression returned if condition is false.

  Return:
    true_expr if condition, false_expr otherwise.
  """
  defmacro if( {:|, _, [{:|||, _, [condition, true_expr]}, false_expr]}) do
    quote do
      if unquote(condition) do
        unquote(true_expr)
      else
        unquote(false_expr)
      end
    end
  end

  # ----------------------------------------------------------------------------
  # region Tuple Helpers
  # ----------------------------------------------------------------------------

  @doc """
  Retrieve a tuple element by index. Syntax:

      some_tuple~>i

  Parameters:
    tuple - The tuple to grab data from.
    index - The index of the element of interest.

  Returns:
    The tuple item at the requested index. Exception if out of range.
  """
  def tuple ~> index, do: elem(tuple, index)

end
