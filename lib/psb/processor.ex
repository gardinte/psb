defmodule Psb.Processor do
  @callback process(map) :: {:ok, map} | {:error, String.t()}

  def process!(data) do
    implementation = Application.get_env(:psb, :processor)

    case implementation.process(data) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "parsing error: #{error}"
    end
  end
end
