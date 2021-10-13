defmodule ElixirTestingTest do
  use ExUnit.Case

  @horizontal_line String.duplicate("-", 80)
  test "test_gobal_constant" do
    IO.puts(@horizontal_line)
    IO.puts("Console Report Section Title")
    IO.puts(@horizontal_line)
    assert true
  end

  test "test_static_function_variable" do
    IO.puts(ElixirTesting.get_value_from_db_cache("A"))
    IO.puts(ElixirTesting.get_value_from_db_cache("B"))
    IO.puts(ElixirTesting.get_value_from_db_cache("A"))
    assert true
  end

  test "test_enumeration" do
    e = %ElixirTesting.IceCreamFlavorEnumeration{}

    v = e.vanilla
    c = e.chocolate
    p = e.peanut_butter

    assert v < c
    assert c < p
  end

  test "test_macro_unless" do
    require Macros
    Macros.fun_unless(true, do: IO.puts "this should never be printed 1")
    Macros.macro_unless true, do: IO.puts "this should never be printed 2"
    assert true
  end

  test "test_macro_ternary" do
    import Macros
    #    IO.puts Macros.ternary(true, "True expression.", "False expression.")
    IO.puts if?(true, "True expression.", "False expression.")
    IO.puts if?(false, "True expression.", "False expression.")
    #    IO.puts true ||| "True expression.", "False expression."
    #    IO.puts if3?(true, do: "True expression.")
    #    IO.puts if3?(false, do: "True expression.")

    #      IO.inspect if true ||| :a | :b
    #      IO.inspect if false ||| :a | :b
    assert true
  end

  test "test_macro_tuple_element" do
    #      t = {:a, :b, :c}
    #
    #
    #      IO.inspect t~>0
    #      IO.inspect t~>1
    #      i=2
    #      IO.inspect t~>i
    assert false
  end

#  test "test_functionalized_stream_composition" do
#    ret_1 = ElixirTesting.test_nonfunctionalized_stream_composition()
#    IO.puts("")
#    ret_2 = ElixirTesting.test_functionalized_stream_composition()
#
#    IO.inspect ret_1, label: "ret_1"
#    IO.inspect ret_2, label: "ret_2"
#
#    assert ret_1 == ret_2
#  end

  test "warpath_testing1" do
    document = %{"elements" => [:a, :b, :c]}
    q = Warpath.query!(document, "$.elements[*]")
    IO.inspect q
    assert [:a, :b, :c] == q
  end

end
