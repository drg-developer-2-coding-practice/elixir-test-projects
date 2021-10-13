defmodule ElixirTesting.MapUtilities do
  # TODO Move to separate library

  @internal_list_selector "$..[?(is_list(@))]"
  def sort_internal_lists(data, sort_fcn \\ fn a, b -> a <= b end) do
    Warpath.update(data, @internal_list_selector, & Enum.sort(&1, sort_fcn))
  end

end
