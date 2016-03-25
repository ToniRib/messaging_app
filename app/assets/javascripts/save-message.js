var saveMessageToConversation = function(body) {
  $.ajax({
    url: '/api/v1/messages',
    type: 'POST',
    data: {
      body: body,
      recipient_id: getRecipientId()
    },
    success: function(message) {
      prependMessageToPage(message);
      addCorrectColor(message);
    }
  });
};
