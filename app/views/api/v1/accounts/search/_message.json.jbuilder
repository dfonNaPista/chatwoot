json.id message.id
json.content message.content
json.message_type message.message_type_before_type_cast
json.content_type message.content_type
json.source_id message.source_id
json.inbox_id message.inbox_id
json.conversation_id message.conversation.try(:display_id)
json.created_at message.created_at.to_i
json.agent do
  json.partial! 'agent', formats: [:json], agent: message.conversation.try(:assignee) if message.conversation.try(:assignee).present?
end
json.inbox do
  json.partial! 'inbox', formats: [:json], inbox: message.inbox if message.inbox.present? && message.try(:inbox).present?
end
