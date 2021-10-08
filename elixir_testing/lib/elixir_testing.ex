defmodule ElixirTesting do
  import ExUnit.Assertions

  def main(argv) do
    {options, _, _} = OptionParser.parse(argv,
      switches: [question: :string]
    )

    IO.inspect options
  end

  # ----------------------------------------------------------------------------
  # region Global Constant
  # ----------------------------------------------------------------------------

  @horizontal_line String.duplicate("-", 80)

  def test_gobal_constant do
    IO.puts(@horizontal_line)
    IO.puts("Console Report Section Title")
    IO.puts(@horizontal_line)
    true
  end

  # ----------------------------------------------------------------------------
  # region Static Function Variable
  # ----------------------------------------------------------------------------

  def test_static_function_variable do
    IO.puts(get_value_from_db_cache("A"))
    IO.puts(get_value_from_db_cache("B"))
    IO.puts(get_value_from_db_cache("A"))
    true
  end

  defp get_value_from_db_cache(key) do

    # We want this to be static.
    data_cache = %{}

    if !Map.has_key?(data_cache, key) do
      # Scope of this assignment is limited to local if block so does not re-bind static variable.
      data_cache = Map.put_new(data_cache, key, get_value_directly_from_db(key))
    end

    data_cache[key]
  end

  @db_data %{ "A" => 3, "B" => 4, "C" => 5, "D" => 6 }
  defp get_value_directly_from_db(key) do
    IO.puts("Inside get_value_directly_from_db for key #{key}")
    @db_data[key]
  end

  # ----------------------------------------------------------------------------
  # region Enumeration
  # ----------------------------------------------------------------------------

  defmodule IceCreamFlavorEnumeration do
    defstruct vanilla: 0, chocolate: 1, peanut_butter: 2
  end

  def test_enumeration do

    e = %IceCreamFlavorEnumeration{}

    v = e.vanilla
    c = e.chocolate
    p = e.peanut_butter

    assert v < c
    assert c < p

  end

  # ----------------------------------------------------------------------------
  # region Macro Testing
  # ----------------------------------------------------------------------------

  def test_macro_unless do
    require Macros
    Macros.fun_unless(true, do: IO.puts "this should never be printed 1")
    Macros.macro_unless true, do: IO.puts "this should never be printed 2"
    :ok
  end

  def test_macro_ternary do
    import Macros
#    IO.puts Macros.ternary(true, "True expression.", "False expression.")
    IO.puts if?(true, "True expression.", "False expression.")
    IO.puts if?(false, "True expression.", "False expression.")
#    IO.puts true ||| "True expression.", "False expression."
#    IO.puts if3?(true, do: "True expression.")
#    IO.puts if3?(false, do: "True expression.")
    :ok
  end

  # ----------------------------------------------------------------------------
  # region Stream Testing
  # ----------------------------------------------------------------------------

  def test_nonfunctionalized_stream_composition() do
    out = IO.stream(:stdio, :line)
    stream = 1..3
      |> Stream.map(&IO.write(out, &1))
      |> Stream.map(&(&1 * 2))
      |> Stream.map(&IO.write(out, &1))
    Enum.to_list(stream)
    out
  end

  def test_functionalized_stream_composition() do
    out = IO.stream(:stdio, :line)
    stream = 1..3
      |> Stream.map(&IO.write(out, &1))
      |> internal_fcn()
      |> Stream.map(&IO.write(out, &1))
    Enum.to_list(stream)
    out
  end

  defp internal_fcn(stream), do: Stream.map(stream, &(&1 * 2))

end





#defmodule Macros do

#end


#
#      t = {:a, :b, :c}
#
#
#      IO.inspect t~>0
#      IO.inspect t~>1
#      i=2
#      IO.inspect t~>i
#
#      IO.inspect if true ||| :a | :b
#      IO.inspect if false ||| :a | :b

