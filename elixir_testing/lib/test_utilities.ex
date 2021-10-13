defmodule ElixirTesting.TestUtilities do

  # ----------------------------------------------------------------------------
  # region Test File Access
  # ----------------------------------------------------------------------------

  @input_dirpath Path.join(["data", "input"])
  def read_input_json(filename), do: Poison.decode!(File.read!(Path.join(@input_dirpath, filename)))

  @expected_dirpath Path.join(["data", "expected"])
  def read_expected_json(filename), do: Poison.decode!(File.read!(Path.join(@expected_dirpath, filename)))

end
