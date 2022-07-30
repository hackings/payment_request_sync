# frozen_string_literal: true

# Application consumer from which all Karafka consumers should inherit
# You can rename it if it would conflict with your current code base (in case you're integrating
# Karafka with other frameworks)
# module DataSync
#     module Ingest
#         module Consumers
module Ingest
  module Consumers
    class KafkaConsumer < Karafka::BaseConsumer
    end
  end
end
# end
