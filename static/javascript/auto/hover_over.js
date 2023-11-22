document.addEventListener('DOMContentLoaded', function () {
  var dropdown = document.querySelector('.dropdown');
  var dropdownContent = document.querySelector('.dropdown-content');
//var authorsTable = document.getElementById('authorsTable');
//var rows = authorsTable.getElementsByTagName('tr');
//var authorsList = [];

//for(var i = 1; i< rows.length;i++) {
//var cell =  rows[i].getElementByTagName('td')[0];
//var authorname = cell.textContent;
//authorsList.push(authorName);
//}

//console.log(authorsList);
 var authorsList = [
    'Rhea Mccoy',
    'Robbie Crane',
    'Shirley Mccarty',
    'Regina Strickland'];

//var authorsList = extractAuthorsFromHTML(htmlCode);
//console.log('authorlist', authorsList);
  // Set hover-over text to the first author
  dropdown.querySelector('span').textContent = authorsList[0];

  // Create HTML table rows for each author
  var tableRows = authorsList.map(function (author, index) {
    return '<tr><td>' + author + '</td></tr>';
  });

  // Insert the table rows into the dropdown content
  dropdownContent.innerHTML = '<table>' + tableRows.join('') + '</table>';

  // Handle click on the dropdown
  dropdown.addEventListener('click', function () {
    dropdownContent.style.display = 'block';
  });
});


