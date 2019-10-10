defmodule PsbTest do
  use ExUnit.Case

  alias GoogleApi.PubSub.V1.Model.PublishResponse

  defmodule PsbTest.Processor do
    @behaviour Psb.Processor

    @impl true
    def process(data) do
      Application.get_env(:psb, :test_process) |> send({:data, data})

      {:ok, data}
    end
  end

  Application.put_env(:psb, :processor, PsbTest.Processor)

  describe "PubSub" do
    test "publish and process" do
      message = %{message: "test"}

      Application.put_env(:psb, :test_process, self())

      assert {:ok, %PublishResponse{}} = Psb.publish(message)
      assert_receive message, 10_000
    end
  end
end
