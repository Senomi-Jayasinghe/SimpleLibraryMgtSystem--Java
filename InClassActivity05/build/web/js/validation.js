function searchBooks() {
    try {
        let query = document.getElementById("searchBox").value;
        let xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    document.getElementById("results").innerHTML = this.responseText;
                } else {
                    console.error("AJAX Error: " + this.status);
                    document.getElementById("results").innerHTML = "<p style='color:red;'>Error fetching results</p>";
                }
            }
        };

        xhttp.open("GET", "ajax/liveSearch.jsp?q=" + encodeURIComponent(query), true);
        xhttp.send();
    } catch (error) {
        console.error("JavaScript error:", error);
        document.getElementById("results").innerHTML = "<p style='color:red;'>Something went wrong</p>";
    }
}

function validateBookForm() {
    let title = document.getElementById("title").value;
    let author = document.getElementById("author").value;
        if (title === "" || author === "") {
            alert("Both title and author must be filled out.");
            return false;
        }
    return true;
}