defmodule Psb.Handler do
  use Broadway

  require Logger

  alias Broadway.Message
  alias Psb.Processor

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producers: [
        default: [
          module: {BroadwayCloudPubSub.Producer, subscription: subscription()}
        ]
      ],
      processors: [
        default: [stages: 5]
      ]
    )
  end

  @impl true
  def handle_message(_processor, message, _context) do
    message
    |> Message.update_data(&process_data/1)
  end

  defp process_data(data) do
    Logger.info("Processing message")

    data
    |> Jason.decode!()
    |> Processor.process!()
  end

  defp subscription do
    project = Application.get_env(:psb, :project)
    subscription = Application.get_env(:psb, :process_topic)

    "projects/#{project}/subscriptions/#{subscription}"
  end
end
