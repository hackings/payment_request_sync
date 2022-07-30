module Notifications
  module ChangeEventObservable
    extend ActiveSupport::Concern

    included do
      after_save :notify_data_change_event
    end

    # Notifies producers if changes
    def notify_data_change_event
      return true unless has_updates_to_notifiable_fields?
      EmitEventService.execute_call(attributes)
    end

    def notifiable_fields
      %i[amount currency description]
    end

    protected

    def has_updates_to_notifiable_fields?
      notifiable_fields.any? { |field| previous_changes&.key?(field) }
    end
  end
end
