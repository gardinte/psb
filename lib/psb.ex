defmodule Psb do
  alias Psb.Publisher

  defdelegate publish(message), to: Publisher
end
