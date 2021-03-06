var getMessages = function(){
  $.ajax({
    url: "/api/v1/messages",
    type: "GET",
    data: {
      recipient_id: getRecipientId()
    },
    success: function(messages) {
      messages.forEach(function(message) {
        prependMessageToPage(message);
        addCorrectColor(message);
      });
    }
  });
};

var getRecipientId = function() {
  return window.location.href.split('/')[window.location.href.split('/').length - 1];
};

var addCorrectColor = function(message) {
  var $messageUsername = $('#messages').find('.message-username').first();
  if (message.username === currentUsername) {
    $messageUsername.css('color', '#04c669');
  } else {
    $messageUsername.css('color', '#00a1ff');
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
                        "<div class='col-xs-10 col-sm-8 col-md-7'>" +
                        "<p class='message-body'>" + message.body + "</p>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>");
};
