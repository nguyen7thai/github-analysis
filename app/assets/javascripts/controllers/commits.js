$(document).ready(function() {
  $('#push-comment-link').on('click', function() {
    var url = $(this).data('url');
    alert('Wait');
    $.ajax({
      url: url,
      method: 'POST',
      success: function() {
        alert('Comments sent');
      },
      error: function() {
        alert('Something went wrong');
      }
    });
  });
});
