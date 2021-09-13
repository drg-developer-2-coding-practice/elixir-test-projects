defmodule EnumFunctions do

  def test_or_into_enum do

    xyz = []  # Returns []
    xyz = nil  # Returns []
    xyz = "[]"  # Returns the contents of the string.

    (xyz || [])
    |> IO.inspect
    |> Enum.map(fn %{"entityId" => entity_id, "filterBy" => filter_by} = _rec ->
      {entity_id, filter_by}
    end)
    |> IO.inspect
    |> Enum.into(%{})
    |> IO.inspect


#    IO.puts( "IO.puts(xyz || [])" )
#    IO.puts(xyz || [])
#    IO.puts( "IO.puts(xyz or [])" )
#    IO.puts(xyz or [])

  end

end
