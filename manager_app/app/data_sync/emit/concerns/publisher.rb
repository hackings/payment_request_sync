module Emit
  module Concerns
    module Publisher
      def publish(event)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
  end
end
