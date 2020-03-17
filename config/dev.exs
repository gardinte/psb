import Config

config :psb,
  process_topic: "development-recordings-creation",
  publish_topic: "development-recordings-completion",
  project: "gardinfra-development",
  processor: Psb.Processors.Dummy
