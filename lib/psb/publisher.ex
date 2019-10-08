defmodule Psb.Publisher do
  import Psb.Connection, only: [conn: 0]

  alias GoogleApi.PubSub.V1, as: GooglePubSub

  def publish(message) do
    GooglePubSub.Api.Projects.pubsub_projects_topics_publish(
      conn(),
      project(),
      completion_topic(),
      body: request(message)
    )
  end

  defp project do
    Application.get_env(:psb, :project)
  end

  defp completion_topic do
    Application.get_env(:psb, :publish_topic)
  end

  defp request(message) do
    data =
      message
      |> Jason.encode!()
      |> Base.encode64()

    %GooglePubSub.Model.PublishRequest{
      messages: [
        %GooglePubSub.Model.PubsubMessage{
          data: data
        }
      ]
    }
  end
end
