var pollForMessages = function() {
  getNewMessages();
};

var getNewMessages = function() {
  $.ajax({
    url: "/api/v1/messages",
    type: "GET",
    data: {
      recipient_id: getRecipientId()
    },
    success: function(messages) {
      var mostRecentMessageId = $('#messages').find('.message').first().attr('id');
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
