class IngestEventService
  attr_accessor :handler

  def self.execute_call(message)
    new.call(message)
  end

  def initialize
    @handler = Resolver.ingest_event_handler
  end

  def call(message)
    event = Events::IngestEvent.new(message.payload)
    handler.handle(event)
  end
end
