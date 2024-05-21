  function expandNames(button) {
    var fullNames =  button.closest('.name-item').querySelector('.full-names');
    var expandIcon =  button.querySelector('img');
    if (fullNames.style.display === 'none'){
      fullNames.style.display = 'block';
      expandIcon.src = '/javascript/images/minus.png';
    } else {
      fullNames.style.display = 'none';
      expandIcon.src = '/javascript/images/plus.png';
    }
  }

