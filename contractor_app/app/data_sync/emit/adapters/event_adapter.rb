module Emit
  module Adapters
    class EventAdapter
      include Emit::Concerns::Adapter

      def adapt(change_data)
        Events::EmitEvent.new(change_data.slice(*Events::EmitEvent.members.collect(&:to_s)))
      end
    end
  end
end
