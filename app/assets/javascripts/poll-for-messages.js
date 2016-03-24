var pollForMessages = function(conversationId) {
  getMessages(conversationId);
};

var clearAllMessages = function() {
  $('.message').remove();
};
