document.addEventListener('DOMContentLoaded', function() {
  var elements = document.querySelectorAll('.ep_link_title');
  elements.forEach(function(element) {
    if (element.scrollHeight > element.clientHeight) {
        element.classList.add('truncated');
    }
  });
});
