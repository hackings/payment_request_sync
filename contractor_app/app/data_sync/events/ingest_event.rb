module Events
  IngestEvent = Struct.new(
    :user_id,
    :status,
    keyword_init: true
  )
end
