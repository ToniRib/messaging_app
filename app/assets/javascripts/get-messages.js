var getMessages = function(conversationId){
  $.ajax({
    url: "/api/v1/messages",
    type: "GET",
    data: {
      conversation_id: conversationId
    },
    success: function(messages) {
      messages.forEach(function(message) {
        appendMessageToPage(message);
      });
    }
  });
};

var appendMessageToPage = function(message) {
  $('#messages').append("<div class='row'>" +
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
