jQuery.ajaxSetup({
  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

$.fn.subSelectWithAjax = function() {
  var that = this;

  this.change(function() {
    $.post(that.attr('rel'), {id: that.val()}, null, "script");
  });
}