<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Book</title>
    
</head>
<body>
    <script src="js/validation.js"></script>
    <input type="text" id="searchBox" onkeyup="searchBooks()" placeholder="Search books...">
    <div id="results"></div>
</body>
</html>