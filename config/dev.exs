import Config

config :psb,
  process_topic: "development-recordings-creation",
  publish_topic: "development-recordings-completion",
  project: "k8s-gardinte-development",
  processor: Psb.Processors.Dummy
