document.addEventListener('DOMContentLoaded', function() {
  var elements = document.querySelectorAll('.ep_link_title');
  elements.forEach(function(element) {
    console.log('scroll' + element.scrollHeight);
    console.log('client' + element.clientHeight);
    if (element.scrollHeight > element.clientHeight) {
        element.classList.add('truncated');
    }
  });
});
