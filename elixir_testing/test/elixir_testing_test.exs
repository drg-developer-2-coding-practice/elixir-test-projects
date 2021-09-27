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

end
