module Events
  EmitEvent = Struct.new(
    :user_id,
    :amount,
    :currency,
    :description,
    :status,
    keyword_init: true
  )
end
