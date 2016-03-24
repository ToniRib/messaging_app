var pollForMessages = function() {
  getMessages(conversationId);
};

var clearAllMessages = function() {
  $('.message').remove();
};
