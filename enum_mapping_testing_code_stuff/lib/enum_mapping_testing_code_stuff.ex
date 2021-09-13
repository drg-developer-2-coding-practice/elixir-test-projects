defmodule Mix.Tasks.EnumMappingTestingCodeStuff do
  use Mix.Task

  def run(_) do
    IO.puts("Select from the below options:")
    IO.puts("")
    IO.puts("  1 - EnumFunctions.test_or_into_enum()")
    IO.puts("")
#    opt = IO.gets("? ")
    opt="1"

    case opt do
      "1" -> EnumFunctions.test_or_into_enum()
      _ -> print_invalid_input_error()
    end

    :ok
  end

  defp print_invalid_input_error do
    IO.puts("")
    IO.puts("Error! Invalid input. Exiting.")
  end

end
