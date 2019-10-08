defmodule Psb.Processors.Dummy do
  @behaviour Psb.Processor

  @impl true
  def process(data), do: {:ok, IO.inspect(data)}
end
