defmodule Psb.Connection do
  alias GoogleApi.PubSub.V1, as: GooglePubSub

  def conn do
    {:ok, token} =
      "https://www.googleapis.com/auth/pubsub"
      |> Goth.Token.for_scope()

    GooglePubSub.Connection.new(token.token)
  end
end
