$(document).ready(function() {
    $('#comments').on('click', '#submit-comment', function(e) {
      e.preventDefault();
      var postId = $(this).data('post-id');
      var commentText = $('.comment-box textarea').val();
      $.ajax({
        url: '/posts/' + postId + '/comments',
        type: 'POST',
        data: { comment: { body: commentText } },
        dataType: 'json',
        success: function(data) {
          $('.comment-box textarea').val('');
          $('#comments').append('<div class="comment"><p>' + data.body + '</p></div>');
        }
      });
    });
  });
