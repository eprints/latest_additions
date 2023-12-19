function expandNames(button) {
  var fullNames = button.parentNode.nextElementSibling;
  var expandIcon = button.querySelector('#expand-icon'); 
  var closeIcon = button.querySelector('#close-icon'); 
    if (expandIcon.style.display !== 'none') {
	fullNames.style.display = 'block';
	expandIcon.style.display = 'none';
	closeIcon.style.display = 'unset';
    } else {
	fullNames.style.display = 'none';
	expandIcon.style.display = 'unset';
	closeIcon.style.display = 'none';
    }
}
