class EmitEventService
  attr_accessor :processor

  def self.execute_call(change_data)
    new.call(change_data)
  end

  def initialize
    @processor = Resolver.emit_event_processor
  end

  def call(change_data)
    processor.handle_data_change_event(change_data)
  end
end
