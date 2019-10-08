defmodule Psb do
  alias Psb.Publisher

  def publish(message), do: Publisher.publish(message)
end
