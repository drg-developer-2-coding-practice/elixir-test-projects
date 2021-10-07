defmodule Macros do

  def fun_unless(clause, do: expression) do
    if(!clause, do: expression)
  end

  defmacro macro_unless(clause, do: expression) do
    quote do
      if(!unquote(clause), do: unquote(expression))
    end
  end

  defmacro ternary(condition, true_expr, false_expr) do
    if condition do
      true_expr
    else
      false_expr
    end
  end
#
#  defmacro ternary2 condition ? true_expr : false_expr do
#    if condition do
#      true_expr
#    else
#      false_expr
#    end
#  end
#
#  defmacro if?(condition, true_expr, false_expr) do
#    if condition do
#      true_expr
#    else
#      false_expr
#    end
#  end

#  defmacro if2?(condition, _?: true_expr, do: false_expr) do
#    if condition do
#      true_expr
#    else
#      false_expr
#    end
#  end

  defmacro if?(condition, true_expr, false_expr) do
    quote do
      if unquote(condition) do
        unquote(true_expr)
      else
        unquote(false_expr)
      end
    end
  end

#  defmacro if3?(condition, do: expression) do
#    quote do
#      if unquote(condition) do
#        unquote(expression)
#      else
#        false
#      end
#    end
#  end






  #
#  def condition ||| true_expr, false_expr do
#    if condition do
#      true_expr
#    else
#      false_expr
#    end
#  end

end
