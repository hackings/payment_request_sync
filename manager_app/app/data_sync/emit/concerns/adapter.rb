module Emit
  module Concerns
    module Adapter
      def adapt(change_data)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
  end
end
