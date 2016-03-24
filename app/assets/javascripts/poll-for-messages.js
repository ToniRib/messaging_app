var pollForMessages = function() {
  var mostRecentMessageId = $('#messages').find('.message').first().attr('id');
  getNewMessages(conversationId, mostRecentMessageId);
};

var getNewMessages = function(conversationId, mostRecentMessageId) {
  $.ajax({
    url: "/api/v1/messages",
    type: "GET",
    data: {
      conversation_id: conversationId
    },
    success: function(messages) {
      messages.forEach(function(message) {
        if (messagesExist(mostRecentMessageId) && thisMessageIsNew(message.id, mostRecentMessageId)) {
          prependMessageToPage(message);
          addCorrectColor(message);
        }
      });
    }
  });
};

var messagesExist = function(recentId) {
  return recentId !== undefined;
};

var thisMessageIsNew = function(newId, mostRecentMessageId) {
  return newId > parseInt(mostRecentMessageId.split("-")[1]);
};
