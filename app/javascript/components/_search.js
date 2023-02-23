const movieDropdown = document.getElementById("movie-dropdown");
const movieSearch = document.getElementById("movie-search");

movieSearch.addEventListener("keyup", function() {
  const filter = movieSearch.value.toUpperCase();
  const options = movieDropdown.options;

  for (let i = 0; i < options.length; i++) {
    const txtValue = options[i].text;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      options[i].style.display = "";
    } else {
      options[i].style.display = "none";
    }
  }
});
