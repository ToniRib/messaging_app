var saveMessageToConversation = function(body, conversationId, userId) {
  $.ajax({
    url: '/api/v1/messages',
    type: 'POST',
    data: {
      body: body,
      conversation_id: conversationId,
      user_id: userId
    },
    success: function(message) {
      appendMessageToPage(message);
    }
  });
};
