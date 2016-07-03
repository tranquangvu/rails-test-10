var content = $("#comment-<%= params[:id] %> .comment-body").first();

content.attr('contenteditable','true');
content.css({'background': '#cfd8dc'});
content.after("<%=j link_to 'Save', comment_path(params[:id]), id: 'save-edited-content', class: 'edit-btn' %>");
content.after("<%=j link_to 'Cancel', '#', id: 'cancel-edited-content', class: 'edit-btn' %>");
content.focus();

var cancelBtn = $('#cancel-edited-content'),
    saveBtn = $('#save-edited-content'),
    current_id = parseInt("#{params[:id]}");

cancelBtn.click(function(e) {
  e.preventDefault();

  content.attr('contenteditable', 'false');
  content.css({'background': 'transparent'});
  cancelBtn.remove();
  saveBtn.remove();
});

saveBtn.click(function(e) {
  e.preventDefault();
  
  $.ajax({
    type: 'PATCH',
    url: $(this).attr('href'),
    data: {
      id: current_id,
      content: content.text()
    },
    success: function(data) {
      content.text(data.content);
      content.attr('contenteditable', 'false');
      content.css({'background': 'transparent'});
      saveBtn.remove();
      cancelBtn.remove();
    },
    error: function (err) {
      alert('Error when update comment');
    }
  });
});
