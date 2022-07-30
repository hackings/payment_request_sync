module Resolver
  def self.emit_event_adapter
    Emit::Adapters::EventAdapter.new
  end

  def self.emit_event_publisher
    Emit::Publishers::EventKafkaPublisher.new
  end

  def self.emit_event_processor
    Emit::Processors::EventProcessor.new(emit_event_publisher, emit_event_adapter)
  end

  def self.ingest_event_handler
    Ingest::EventHandlers::EventHandler.new
  end
end
