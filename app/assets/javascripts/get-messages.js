var getMessages = function(conversationId){
  $.ajax({
    url: "/api/v1/messages",
    type: "GET",
    data: {
      conversation_id: conversationId
    },
    success: function(messages) {
      messages.forEach(function(message) {
        prependMessageToPage(message);
        addCorrectColor(message);
      });
    }
  });
};

var addCorrectColor = function(message) {
  var $messageUsername = $('#messages').find('.message-username').first();
  if (message.username === currentUsername) {
    $messageUsername.css('color', 'red');
  } else {
    $messageUsername.css('color', 'blue');
  }
};

var prependMessageToPage = function(message) {
  var newId = "message-" + message.id;
  $('#messages').prepend("<div class='row message' id='" + newId + "'>" +
                        "<div class='col-sm-12'>" +
                        "<div class='row'>" +
                        "<div class='col-sm-6 left'>" +
                        "<h4 class='message-username'>" + message.username + "</h4>" +
                        "</div>" +
                        "<div class='col-sm-6 right'>" +
                        "<h5 class='message-time'>" + message.sent_at + "</h5>" +
                        "</div>" +
                        "<div class='row'>" +
                        "<div class='col-sm-12'>" +
                        "<p class='message-body'>" + message.body + "</p>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>");
};
