defmodule ElixirTesting do
  import ExUnit.Assertions

  def main(argv) do
    {options, _, _} = OptionParser.parse(argv,
      switches: [question: :string]
    )

    IO.inspect options
  end

  # ----------------------------------------------------------------------------
  # region Static Function Variable
  # ----------------------------------------------------------------------------

  def get_value_from_db_cache(key) do

    # We want this to be static.
    data_cache = %{}

    if !Map.has_key?(data_cache, key) do
      # Scope of this assignment is limited to local if block so does not re-bind static variable.
      data_cache = Map.put_new(data_cache, key, get_value_directly_from_db(key))
    end

    data_cache[key]
  end

  @db_data %{ "A" => 3, "B" => 4, "C" => 5, "D" => 6 }
  def get_value_directly_from_db(key) do
    IO.puts("Inside get_value_directly_from_db for key #{key}")
    @db_data[key]
  end

  # ----------------------------------------------------------------------------
  # region Enumeration
  # ----------------------------------------------------------------------------

  defmodule IceCreamFlavorEnumeration do
    defstruct vanilla: 0, chocolate: 1, peanut_butter: 2
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

  # ----------------------------------------------------------------------------
  # region
  # ----------------------------------------------------------------------------


end
