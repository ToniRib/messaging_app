var getMessages = function(conversationId){
  $.ajax({
    url: "/api/v1/messages",
    type: "GET",
    data: {
      conversation_id: conversationId
    },
    success: function(messages) {
      clearAllMessages();
      messages.forEach(function(message) {
        prependMessageToPage(message);
      });
    }
  });
};

var prependMessageToPage = function(message) {
  $('#messages').prepend("<div class='row message'>" +
                        "<div class='col-sm-12'>" +
                        "<div class='row'>" +
                        "<div class='col-sm-6 left'>" +
                        "<h4>" + message.username + "</h4>" +
                        "</div>" +
                        "<div class='col-sm-6 right'>" +
                        "<h4>" + message.sent_at + "</h4>" +
                        "</div>" +
                        "<div class='row'>" +
                        "<div class='col-sm-12'>" +
                        "<p>" + message.body + "</p>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>");
};
