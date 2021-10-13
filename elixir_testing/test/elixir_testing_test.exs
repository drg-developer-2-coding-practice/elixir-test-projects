defmodule ElixirTestingTest do
  use ExUnit.Case
  require Macros
  import Macros
  alias ElixirTesting.MapUtilities
  alias ElixirTesting.TestUtilities

  describe "Globals and Constants Testing:" do

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

  end

  describe "Enumeration Alternatives Testing:" do

    test "test_enumeration" do
      e = %ElixirTesting.IceCreamFlavorEnumeration{}

      v = e.vanilla
      c = e.chocolate
      p = e.peanut_butter

      assert v < c
      assert c < p
    end

  end

  describe "Macros Testing:" do

    test "test_macro_unless" do
      Macros.fun_unless(true, do: IO.puts "this should never be printed 1")
      Macros.macro_unless true, do: IO.puts "this should never be printed 2"
      assert true
    end

    test "test_macro_ternary" do
      a = if true ||| "True expression." | "False expression."
      b = if false ||| "True expression." | "False expression."
      assert a == "True expression."
      assert b == "False expression."
    end

    test "test_macro_tuple_element" do
      t = {:a, :b, :c}

      assert :a == t~>0
      assert :b == t~>1
      assert :c == t~>2

      i=2
      assert :c == t~>i
    end

  end

  describe "Streams Testing:" do

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

  describe "Warpath (https://hexdox.pm/warpath/Warpath.html) Testing:" do

    test "warpath_testing1" do
      document = %{"elements" => [:a, :b, :c]}
      q = Warpath.query!(document, "$.elements[*]")
      IO.inspect q
      assert [:a, :b, :c] == q
    end

    @input_filename "warpath_testing2_input.json"
    @expected_decomposition_filename "warpath_testing2_expected_decomposition.json"
    @expected_selectedlists_filename "warpath_testing2_expected_selectedlists.json"
    @expected_sorted_filename_1 "warpath_testing2_expected_sorted_1.json"
    @expected_sorted_filename_2 "warpath_testing2_expected_sorted_2.json"
    test "warpath_testing2" do

      input = TestUtilities.read_input_json(@input_filename)
      expected_decomposition = TestUtilities.read_expected_json(@expected_decomposition_filename)
      expected_selectedlists = TestUtilities.read_expected_json(@expected_selectedlists_filename)
      expected_sorted_1 = TestUtilities.read_expected_json(@expected_sorted_filename_1)
      expected_sorted_2 = TestUtilities.read_expected_json(@expected_sorted_filename_2)

      # Decomposition
      decomposed = Warpath.query!(input, "$..*")
      assert expected_decomposition == decomposed

      # Selection
      selectedlists = Warpath.query!(input, "$..[?(is_list(@))]")
      assert expected_selectedlists == selectedlists

      # Sorting 1
      {:ok, sorted} = MapUtilities.sort_internal_lists(input)
      IO.inspect sorted
      assert expected_sorted_1 == sorted

      # Sorting 2
      {:ok, sorted} = MapUtilities.sort_internal_lists(input, & &1 >= &2)
      IO.inspect sorted
      assert expected_sorted_2 == sorted

      # Composition
      #NOT POSSIBLE - Unable to relate downstream map components to keys.
      #ElxirTesting.compose_warpath(decomposed)

    end

  end

end
