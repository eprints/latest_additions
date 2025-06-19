  function expandNames(button) {
    var fullNames =  button.closest('.name-item').querySelector('.full-names');
    var expandIcon =  button.querySelector('img');
    if (fullNames.style.display === 'none'){
      fullNames.style.display = 'block';
      expandIcon.src = '/style/images/minus.svg';
    } else {
      fullNames.style.display = 'none';
      expandIcon.src = '/style/images/plus.svg';
    }
  }

