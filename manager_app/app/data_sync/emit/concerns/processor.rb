module Emit
  module Concerns
    module Processor
      def handle_data_change_event(change_data)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
  end
end
