defmodule ElixirTesting do

  @horizontal_line String.duplicate("-", 80)

  def test_gobal_constant do
    IO.puts(@horizontal_line)
    IO.puts("Console Report Section Title")
    IO.puts(@horizontal_line)
    true
  end

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

end
