defmodule ElixirTestingTest do
  use ExUnit.Case

  test "test_gobal_constant" do
    assert ElixirTesting.test_gobal_constant
  end

  test "test_static_function_variable" do
    assert ElixirTesting.test_static_function_variable
  end

  test "test_enumeration" do
    assert ElixirTesting.test_enumeration
  end

  test "test_macro_unless" do
    assert ElixirTesting.test_macro_unless
  end

  test "test_macro_ternary" do
    assert ElixirTesting.test_macro_ternary
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

end
